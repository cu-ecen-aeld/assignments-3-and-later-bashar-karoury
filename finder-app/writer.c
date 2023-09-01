#include <stdio.h>
#include <errno.h>
#include <syslog.h>
#include <string.h>
// defining main with arguments
int main(int argc, char* argv[])
{
  
  //Check Number of Arguments 
  if(3 != argc){
            syslog(LOG_ERR, "One of Arguments is missing\n");
        return 1;
  }

  //Setup  syslog logging  with facility LOG_USER
  openlog(NULL, 0, LOG_USER);

  //open file for writing
  FILE* f_ptr = NULL;    
  f_ptr = fopen(argv[1], "w");

  //Check file has been opened
  if(f_ptr == NULL){
	char* error_msg = strerror(errno);
	syslog(LOG_ERR, "%s", error_msg);
	return 1;
  }
  else{
	//Write passed stirng to file
  	fprintf(f_ptr,"%s\n",argv[2]);
  
	//Check if writing is successful
  	if(errno){
		char* error_msg = strerror(errno);
		syslog(LOG_ERR, "%s", error_msg);
  	}
	else{
		//Log the successful operation
		syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
  	}
  	fclose(f_ptr);
  }
  return 0;
}
