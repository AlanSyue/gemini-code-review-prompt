# Gemini Code Review Prompt Generator

This repository contains a simple shell script (`main.sh`) that helps you generate a prompt for Google's Gemini to review your code changes.

## Prerequisites

Before using this script, you need to have the [Gemini CLI](https://github.com/google/generative-ai-go/tree/main/cmd/gemini) installed and configured on your system.

## How to Use

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/gemini-code-review-prompt.git
    cd gemini-code-review-prompt
    ```

2.  **Make the script executable:**

    ```bash
    chmod +x main.sh
    ```

3.  **Run the script:**

    ```bash
    ./main.sh
    ```

4.  **Enter the starting commit SHA:**

    The script will prompt you to enter the commit SHA from which you want to start the code review. For example, if you want to review all the changes from commit `abc1234` to `HEAD`, you would enter `abc1234`.

5.  **Review the generated prompt:**

    The script will then generate a prompt that you can use with the Gemini CLI. The prompt will ask Gemini to review the code changes between the specified commit and `HEAD`, looking for potential bugs, logic issues, naming and readability problems, and opportunities for refactoring.

## Example

```
$ ./main.sh
請輸入起始 commit SHA（例如 abc1234）: abc1234
```

This will generate the following prompt for the Gemini CLI:

```
請協助我審查這次的程式碼變更（從 abc1234 到 HEAD），請指出：
- 潛在錯誤或邏輯問題
- 命名與可讀性問題
- 程式結構是否清晰、是否符合良好設計原則
- 若有可重構處請提出具體建議
請條列列出建議，若能指出檔名與行數更佳。但不要直接根據建議修改
```

## How it Works

The script first checks if you are in a Git repository and if the specified commit SHA is valid. It then constructs a detailed prompt for the Gemini CLI, instructing it to perform a code review. The `--yolo` flag is used to automatically execute the prompt with Gemini.

## Contributing

Contributions are welcome! Please feel free to submit a pull request with any improvements or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
