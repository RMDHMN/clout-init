# A bunch of terraform files to get familiar with the most known AWS services

After configuring your local with your AWS account by using (aws configure)

Use the /terraTest folder as a terraform workspace by running on it ( terraform init ).

Use the command (cp) to copy the files, following their numbers (from 0 to 15), and excute them one by one to help you understand which ressources depend on which ones.

For each file copied, execute ( terraform plan ) to see which changes will happen, than ( terraform apply ) to confirm and deploy the desired ressources, than keep adding files following their numbers.


Make sure to change specific parameters as region, AZ, networks subnets, domain names, instance types ...etc as desired.
