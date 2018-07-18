FROM ubuntu


# Install requirements
RUN apt-get update && \
	  apt-get install -y lib32ncurses5 expect udev make gcc gcc-arm-linux-gnueabi tar bzip2

# Copy project files
COPY swinstall_script.sh install_sw4stm32_linux_64bits-latest.run ./
COPY firmware ./firmware


#Install System Workbench

RUN chmod +x install_sw4stm32_linux_64bits-v2.4.run && \
     expect swinstall_script.sh

#Install arm correctly
 RUN cd root/Ac6/SystemWorkbench/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.15.0.201708311556/tools && \
		tar -xjf st-gnu-arm-gcc-6-2017-q2-update_gdb-5_4-2016q3-20160926-linux.tar.bz2 && \
		mv st-gnu-arm-gcc-6-2017-q2-update_gdb-5_4-2016q3 compiler


#Build in commandline
#RUN  mkdir builds && \
#root/Ac6/SystemWorkbench/eclipse -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild \
#-import firmware  -build Heaterv1-firmware/Debug
