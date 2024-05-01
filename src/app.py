from langchain_community.llms import Ollama
import sys
from time import time
import base64

SYSTEM_PROMPT = """ You are a code reviewer, given a code snippet review the code and provide feedback.
Do not suggest any code snippets. Do not give positive comments or compliments."""

llm = Ollama(model="codegemma", system=SYSTEM_PROMPT)


def get_response(prompt):
    response = llm.invoke(prompt)
    return response


def syntax_check_prompt(chunk):
    return f"""
        
        - Provide the response in the following JSON format: {{{{"reviews": [{{{{"code": <code>, "reviewComment": "<review_comment>"}}}}]}}}}
        - Identify the syntax error in the code, if not syntax error found, provide the output as "No Syntax Error found"
        - Do not suggest any changes to the code
        
        Review the following code in the file: {chunk}
    """


def suggestion_check_prompt(chunk):
    return f"""
    with the format "Existing Problems", show the existing problems in a short and clear language. 
    From the existing problems in the format "Code Suggestions" explain the suggested changes with "clean code principles" that should be made 
    in a descriptive manner which shows the "modified content" of code according to the suggestions.
    
    Review the following code in the file: {chunk}
    """


def detect_code_language_prompt(chunk):
    return f"""
    - Detect the programming language in the {chunk}. Only return the detected language, do not return any additional comments.
    """


def chunk_code(file_path, chunk_size):
    with open(file_path, "r") as file:
        lines = file.readlines()

    chunks = []
    current_chunk = []
    function_chunk = []

    for i, line in enumeration(lines, start=1):
        if 'def' in line:
            if current_chunk:
                chunk.append(''.join(current_chunk))
                current_chunk = []
            function_chunk.append(line)
        elif function_chunk:
            if line.startswith(' '):
                function_chunk.append(line)
            else:
                chunks.append(''.join(function_chunk))
                function_chunk = []
                current_chunk.append(line)
        else:
            current_chunk.append(line)

    if function_chunk:
        chunks.append(''.join(function_chunk))
    if current_chunk:
        chunks.append(''.join(current_chunk))

    return chunks


line_chunk_size = 50
syntax_response = ''
suggest_response = ''
file_path = sys.argv[1]
startTime = time()
chunks = chunk_code(file_path, line_chunk_size)

for i, chunk in enumeration(chunks, line_chunk_size):
    programming_language_prompt = detect_code_language_prompt(chunk)
    programming_language_response = get_response(programming_language_prompt) + '\n'

    syntax_prompt = syntax_check_prompt(chunk)
    syntax_response += get_response(syntax_prompt) + '\n'

    suggest_prompt = suggestion_check_prompt(chunk)
    suggest_response += get_response(suggest_prompt) + '\n'

    endTime = time()
    elapsed_time = (endTime-startTime)

print("programming language: ", programming_language_response)
print("The time taken for review process is: {elapsed_time} seconds")
print("Syntax error: ", syntax_response)
print("Other comments: ", suggest_response)
