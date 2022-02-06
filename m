Content-Type: multipart/mixed; boundary="===============8084693551545928843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:devel 28/29] drivers/tty/serial/altera_uart.c:102:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Sun, 06 Feb 2022 09:48:02 +0800
Message-ID: <202202060639.6o4ulcor-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8084693551545928843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Slaby <jslaby@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   4ab10f786a6d05b93cffeaa8ad2497a49d494ee5
commit: c76d9e8f011098bd5e9eafd750fe589c04ef06e1 [28/29] tty: serial, use u=
art_port_tx
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/tty/serial/altera_uart.c:102:2: warning: Non-boolean value retur=
ned from function returning bool [returnNonBoolInBooleanFunction]
    return altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
    ^
>> drivers/tty/serial/mxs-auart.c:470:2: warning: Non-boolean value returne=
d from function returning bool [returnNonBoolInBooleanFunction]
    return s->flags & MXS_AUART_DMA_ENABLED;
    ^

vim +102 drivers/tty/serial/altera_uart.c

6b7d8f8b5c43f7 drivers/serial/altera_uart.c     Tobias Klauser 2010-05-05  =
 99  =

c76d9e8f011098 drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
100  static bool altera_uart_tx_ready(struct uart_port *port)
c76d9e8f011098 drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
101  {
c76d9e8f011098 drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11 @=
102  	return altera_uart_readl(port, ALTERA_UART_STATUS_REG) &
c76d9e8f011098 drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
103  		ALTERA_UART_STATUS_TRDY_MSK;
c76d9e8f011098 drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
104  }
c76d9e8f011098 drivers/tty/serial/altera_uart.c Jiri Slaby     2022-01-11  =
105  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8084693551545928843==--

