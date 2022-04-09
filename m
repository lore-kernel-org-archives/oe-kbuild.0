Content-Type: multipart/mixed; boundary="===============7829242370046519925=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jirislaby:devel 48/50] drivers/tty/serial/cpm_uart/cpm_uart.h: cpm_uart_cpm2.h is included more than once.
Date: Sat, 09 Apr 2022 09:57:26 +0800
Message-ID: <202204090910.cB8K9hwE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7829242370046519925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Slaby <jslaby@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git=
 devel
head:   100a309b4d75252d31b3ae0e69d6469ac0e0f522
commit: dea848f47bb67e2d6b83d79dac335852ea468c82 [48/50] tty: serial: allow=
 COMPILE_TEST for some drivers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/tty/serial/cpm_uart/cpm_uart.h: cpm_uart_cpm2.h is included more=
 than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7829242370046519925==--

