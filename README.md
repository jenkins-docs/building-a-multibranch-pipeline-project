#building-a-multibranch-pipeline-project

这个存储库是为了
[建立一个多分支管道项目]（https://jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/）
[Jenkins用户文档]（https://jenkins.io/doc/）中的教程。

本教程使用与[Build a Node.js和React app]相同的应用程序
同
NPM]（https://jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/）
教程基于。因此，您将构建和测试相同的内容
申请，但这次，它的交付将根据Git而有所不同
Jenkins构建的分支。也就是说，正在构建的分支决定了
您的管道的交付阶段被执行。

`jenkins`目录包含`Jenkinsfile`的示例（即Pipeline）
你将在教程和`scripts`子目录中创建自己
包含shell脚本，其中包含在Jenkins处理时执行的命令
您可以使用“交付开发”或“部署生产”阶段
管道（取决于Jenkins构建的分支）。
