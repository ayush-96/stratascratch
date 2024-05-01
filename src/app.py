from langchain_community.llms import Ollama
import sys
from time import time
import base64

SYSTEM_PROMPT = """ You are a code reviewer, given a code snippet review the code and provide feedback.
Do not suggest any code snippets. Do not give positive comments or compliments."""

llm = Ollama(model="codegemma", system = SYSTEM_PROMPT
