FROM ubuntu

# Install requirements
RUN apt-get update && \
		apt-get install -y lib32ncurses5 expect udev make wget gcc gcc-arm-linux-gnueabi tar bzip2

# Environment variable
ENV SW4STM32_VERSION 2.4

# Utils
COPY swinstall_script.sh ./

# Install System Workbench
RUN wget www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-v${SW4STM32_VERSION}.run && \
		chmod +x install_sw4stm32_linux_64bits-v${SW4STM32_VERSION}.run && \
		expect swinstall_script.sh install_sw4stm32_linux_64bits-v${SW4STM32_VERSION}.run && \
		rm -f install_sw4stm32_linux_64bits-v${SW4STM32_VERSION}.run

# Install arm correctly
 RUN cd root/Ac6/SystemWorkbench/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.15.0.201708311556/tools && \
		tar -xjf st-gnu-arm-gcc-6-2017-q2-update_gdb-5_4-2016q3-20160926-linux.tar.bz2 && \
		mv st-gnu-arm-gcc-6-2017-q2-update_gdb-5_4-2016q3 compiler
