Content-Type: multipart/mixed; boundary="===============2419473879768065007=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/core/port.c:227:2: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry_safe is a macro then please configure it. [unknownMacro]
Date: Sat, 02 Apr 2022 17:44:10 +0800
Message-ID: <202204021736.0PrnmpnY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2419473879768065007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: 0ff0af18216436d0151af4e410400c7a19ca9437 cxl/core/port: Rename bus.=
c to port.c
date:   7 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/core/port.c:227:2: warning: There is an unknown macro here s=
omewhere. Configuration is required. If list_for_each_entry_safe is a macro=
 then please configure it. [unknownMacro]
    list_for_each_entry_safe(dport, _d, &port->dports, list)
    ^

vim +227 drivers/cxl/core/port.c

7d4b5ca2e2cb5d drivers/cxl/core.c Dan Williams 2021-06-09  220  =

4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  221  static void=
 cxl_port_release(struct device *dev)
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  222  {
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  223  	struct cxl=
_port *port =3D to_cxl_port(dev);
7d4b5ca2e2cb5d drivers/cxl/core.c Dan Williams 2021-06-09  224  	struct cxl=
_dport *dport, *_d;
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  225  =

7d4b5ca2e2cb5d drivers/cxl/core.c Dan Williams 2021-06-09  226  	device_loc=
k(dev);
7d4b5ca2e2cb5d drivers/cxl/core.c Dan Williams 2021-06-09 @227  	list_for_e=
ach_entry_safe(dport, _d, &port->dports, list)
7d4b5ca2e2cb5d drivers/cxl/core.c Dan Williams 2021-06-09  228  		cxl_dport=
_release(dport);
7d4b5ca2e2cb5d drivers/cxl/core.c Dan Williams 2021-06-09  229  	device_unl=
ock(dev);
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  230  	ida_free(&=
cxl_port_ida, port->id);
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  231  	kfree(port=
);
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  232  }
4812be97c015bd drivers/cxl/core.c Dan Williams 2021-06-09  233  =


:::::: The code at line 227 was first introduced by commit
:::::: 7d4b5ca2e2cb5d28db628ec79c706bcfa832feea cxl/acpi: Add downstream po=
rt data to cxl_port instances

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2419473879768065007==--

