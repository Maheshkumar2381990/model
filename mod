<!DOCTYPE html>
<html>

<head>
    <title>Ticket Conversations Widget</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <style>
        .container {
            width: 400px;
            border: 1px solid #ccc;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #f0f0f0;
            padding: 10px;
        }

        .header h2 {
            margin: 0;
        }

        .conversation {
            padding: 10px;
        }

        .message {
            margin-bottom: 10px;
        }

        .user-message {
            background-color: #f0f0f0;
            padding: 5px;
        }

        .agent-message {
            background-color: #d0e9ff;
            padding: 5px;
        }

        .attachment {
            padding-top: 10px;
        }

        .attachment .btn {
            margin-right: 5px;
        }

        .input-container {
            padding: 10px;
            border-top: 1px solid #ccc;
        }

        .input-container input[type="text"] {
            width: 100%;
            padding: 5px;
        }

        .input-container input[type="file"] {
            display: none;
        }

        .input-container .btn {
            padding: 5px 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2>Ticket Conversations</h2>
        </div>
        <div class="conversation">
            <div class="message user-message">
                <p>Hello, I'm having trouble accessing my account. Can you help me with that?</p>
            </div>
            <div class="message agent-message">
                <p>Sure, I'll be happy to assist you. Could you please provide me with your account username?</p>
            </div>
            <div class="message user-message">
                <p>My username is johndoe123.</p>
            </div>
            <div class="message agent-message">
                <p>Thank you for providing your username. I'll look into the issue and get back to you shortly.</p>
            </div>
            <div class="message agent-message">
                <p>After investigating, it seems that your account is temporarily locked for security purposes. I have
                    unlocked it now, and you should be able to access your account again. Please try logging in and let
                    me know if you encounter any further issues.</p>
            </div>
            <div class="message user-message">
                <p>Thank you for your help! I can now access my account without any problems.</p>
            </div>
            <div class="message agent-message">
                <p>You're welcome! I'm glad the issue is resolved. If you have any other questions or need further
                    assistance, feel free to ask. Have a great day!</p>
            </div>
        </div>
        <div class="attachment">
            <label for="attachment-input">Attachment:</label>
            <input type="file" id="attachment-input">
            <button type="button" class="btn btn-primary" id="attachment-button">Attach</button>
        </div>
        <div class="input-container">
            <form id="message-form">
                <div class="input-group">
                    <input type="text" id="message-input" class="form-control" placeholder="Type your message...">
                    <span class="input-group-btn">
                        <input type="submit" value="Send" class="btn btn-success">
                    </span>
                </div>
            </form>
        </div>
    </div>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script>
        document.getElementById("message-form").addEventListener("submit", function (event) {
            event.preventDefault();
            sendMessage();
        });

        document.getElementById("attachment-button").addEventListener("click", function () {
            document.getElementById("attachment-input").click();
        });

        document.getElementById("attachment-input").addEventListener("change", function () {
            var files = this.files;
            var fileNames = "";

            for (var i = 0; i < files.length; i++) {
                fileNames += files[i].name + ", ";
            }

            fileNames = fileNames.substring(0, fileNames.length - 2);

            var messageInput = document.getElementById("message-input");
            messageInput.value += " [Attachment: " + fileNames + "]";
        });

        function sendMessage() {
            var messageInput = document.getElementById("message-input");
            var message = messageInput.value;

            if (message.trim() !== "") {
                var conversation = document.querySelector(".conversation");
                var messageDiv = document.createElement("div");
                messageDiv.classList.add("message", "user-message");
                messageDiv.innerHTML = "<p>" + message + "</p>";
                conversation.appendChild(messageDiv);

                messageInput.value = "";
                messageInput.focus();
            }
        }
    </script>
</body>

</html>
