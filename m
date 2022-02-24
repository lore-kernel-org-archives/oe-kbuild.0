Content-Type: multipart/mixed; boundary="===============8963546334581796749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:devel 28/29] drivers/tty/serial/altera_uart.c:102:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Fri, 25 Feb 2022 03:09:18 +0800
Message-ID: <202202250037.NsHjPWC5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8963546334581796749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Slaby <jslaby@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   89830a2e427ed8ad318c6183ad524709ba507133
commit: fd2708e7ec041a780c540a33fe971f78b475f6a8 [28/29] tty: serial, use u=
art_port_tx
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/tty/serial/altera_uart.c:102:2: warning: Non-boolean value retur=
ned from function returning bool [returnNonBoolInBooleanFunction]
    return altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
    ^

vim +102 drivers/tty/serial/altera_uart.c

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser 2010-05-05  =
 99  =

fd2708e7ec041a drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
100  static bool altera_uart_tx_ready(struct uart_port *port)
fd2708e7ec041a drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
101  {
fd2708e7ec041a drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11 @=
102  	return altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
fd2708e7ec041a drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
103  		ALTERA_UART_STATUS_TRDY_MSK;
fd2708e7ec041a drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
104  }
fd2708e7ec041a drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
105  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8963546334581796749==--

