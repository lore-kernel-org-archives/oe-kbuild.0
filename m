Content-Type: multipart/mixed; boundary="===============6634893426482449872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/driver.c:1606:3: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Tue, 05 Apr 2022 15:12:42 +0800
Message-ID: <202204051549.lpJfHbTe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6634893426482449872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/=
firmware/Kconfig unconditionally
date:   6 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 6 months ago
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/driver.c:1606:3: warning: There is an unknown =
macro here somewhere. Configuration is required. If list_for_each_entry is =
a macro then please configure it. [unknownMacro]
     list_for_each_entry(rdev, phead, node)
     ^

vim +1606 drivers/firmware/arm_scmi/driver.c

bc40081d9825c7 Sudeep Holla     2017-06-06  1584  =

d4f9dddd21f393 Cristian Marussi 2021-03-16  1585  /**
d4f9dddd21f393 Cristian Marussi 2021-03-16  1586   * scmi_create_protocol_d=
evices  - Create devices for all pending requests for
d4f9dddd21f393 Cristian Marussi 2021-03-16  1587   * this SCMI instance.
d4f9dddd21f393 Cristian Marussi 2021-03-16  1588   *
d4f9dddd21f393 Cristian Marussi 2021-03-16  1589   * @np: The device node d=
escribing the protocol
d4f9dddd21f393 Cristian Marussi 2021-03-16  1590   * @info: The SCMI instan=
ce descriptor
d4f9dddd21f393 Cristian Marussi 2021-03-16  1591   * @prot_id: The protocol=
 ID
d4f9dddd21f393 Cristian Marussi 2021-03-16  1592   *
d4f9dddd21f393 Cristian Marussi 2021-03-16  1593   * All devices previously=
 requested for this instance (if any) are found and
d4f9dddd21f393 Cristian Marussi 2021-03-16  1594   * created by scanning th=
e proper @&scmi_requested_devices entry.
d4f9dddd21f393 Cristian Marussi 2021-03-16  1595   */
d4f9dddd21f393 Cristian Marussi 2021-03-16  1596  static void scmi_create_p=
rotocol_devices(struct device_node *np,
d4f9dddd21f393 Cristian Marussi 2021-03-16  1597  					 struct scmi_info *i=
nfo, int prot_id)
d4f9dddd21f393 Cristian Marussi 2021-03-16  1598  {
d4f9dddd21f393 Cristian Marussi 2021-03-16  1599  	struct list_head *phead;
9c5c463f2adf14 Sudeep Holla     2019-11-06  1600  =

d4f9dddd21f393 Cristian Marussi 2021-03-16  1601  	mutex_lock(&scmi_request=
ed_devices_mtx);
d4f9dddd21f393 Cristian Marussi 2021-03-16  1602  	phead =3D idr_find(&scmi=
_requested_devices, prot_id);
d4f9dddd21f393 Cristian Marussi 2021-03-16  1603  	if (phead) {
d4f9dddd21f393 Cristian Marussi 2021-03-16  1604  		struct scmi_requested_d=
ev *rdev;
9c5c463f2adf14 Sudeep Holla     2019-11-06  1605  =

d4f9dddd21f393 Cristian Marussi 2021-03-16 @1606  		list_for_each_entry(rde=
v, phead, node)
d4f9dddd21f393 Cristian Marussi 2021-03-16  1607  			scmi_create_protocol_d=
evice(np, info, prot_id,
d4f9dddd21f393 Cristian Marussi 2021-03-16  1608  						    rdev->id_table-=
>name);
d4f9dddd21f393 Cristian Marussi 2021-03-16  1609  	}
d4f9dddd21f393 Cristian Marussi 2021-03-16  1610  	mutex_unlock(&scmi_reque=
sted_devices_mtx);
d4f9dddd21f393 Cristian Marussi 2021-03-16  1611  }
d4f9dddd21f393 Cristian Marussi 2021-03-16  1612  =


:::::: The code at line 1606 was first introduced by commit
:::::: d4f9dddd21f39395c62ea12d3d91239637d4805f firmware: arm_scmi: Add dyn=
amic scmi devices creation

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6634893426482449872==--

