Content-Type: multipart/mixed; boundary="===============4461949041769761290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/driver.c:1278:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Thu, 18 Nov 2021 06:31:00 +0800
Message-ID: <202111180644.QnV4LrZZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4461949041769761290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ee1703cda8dc777e937dec172da55beaf1a74919
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/=
firmware/Kconfig unconditionally
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/driver.c:1278:2: warning: Address of local aut=
o-variable assigned to a function parameter. [autoVariables]
    *ph =3D &pi->ph;
    ^

vim +1278 drivers/firmware/arm_scmi/driver.c

23934efe3748f6 Cristian Marussi 2021-03-16  1233  =

23934efe3748f6 Cristian Marussi 2021-03-16  1234  /**
23934efe3748f6 Cristian Marussi 2021-03-16  1235   * scmi_devm_protocol_get=
  - Devres managed get protocol operations and handle
23934efe3748f6 Cristian Marussi 2021-03-16  1236   * @sdev: A reference to =
an scmi_device whose embedded struct device is to
23934efe3748f6 Cristian Marussi 2021-03-16  1237   *	  be used for devres a=
ccounting.
23934efe3748f6 Cristian Marussi 2021-03-16  1238   * @protocol_id: The prot=
ocol being requested.
23934efe3748f6 Cristian Marussi 2021-03-16  1239   * @ph: A pointer referen=
ce used to pass back the associated protocol handle.
23934efe3748f6 Cristian Marussi 2021-03-16  1240   *
23934efe3748f6 Cristian Marussi 2021-03-16  1241   * Get hold of a protocol=
 accounting for its usage, eventually triggering its
23934efe3748f6 Cristian Marussi 2021-03-16  1242   * initialization, and re=
turning the protocol specific operations and related
23934efe3748f6 Cristian Marussi 2021-03-16  1243   * protocol handle which =
will be used as first argument in most of the
23934efe3748f6 Cristian Marussi 2021-03-16  1244   * protocols operations m=
ethods.
23934efe3748f6 Cristian Marussi 2021-03-16  1245   * Being a devres based m=
anaged method, protocol hold will be automatically
23934efe3748f6 Cristian Marussi 2021-03-16  1246   * released, and possibly=
 de-initialized on last user, once the SCMI driver
23934efe3748f6 Cristian Marussi 2021-03-16  1247   * owning the scmi_device=
 is unbound from it.
23934efe3748f6 Cristian Marussi 2021-03-16  1248   *
23934efe3748f6 Cristian Marussi 2021-03-16  1249   * Return: A reference to=
 the requested protocol operations or error.
23934efe3748f6 Cristian Marussi 2021-03-16  1250   *	   Must be checked for=
 errors by caller.
23934efe3748f6 Cristian Marussi 2021-03-16  1251   */
23934efe3748f6 Cristian Marussi 2021-03-16  1252  static const void __must_=
check *
23934efe3748f6 Cristian Marussi 2021-03-16  1253  scmi_devm_protocol_get(st=
ruct scmi_device *sdev, u8 protocol_id,
23934efe3748f6 Cristian Marussi 2021-03-16  1254  		       struct scmi_prot=
ocol_handle **ph)
23934efe3748f6 Cristian Marussi 2021-03-16  1255  {
23934efe3748f6 Cristian Marussi 2021-03-16  1256  	struct scmi_protocol_ins=
tance *pi;
23934efe3748f6 Cristian Marussi 2021-03-16  1257  	struct scmi_protocol_dev=
res *dres;
23934efe3748f6 Cristian Marussi 2021-03-16  1258  	struct scmi_handle *hand=
le =3D sdev->handle;
23934efe3748f6 Cristian Marussi 2021-03-16  1259  =

23934efe3748f6 Cristian Marussi 2021-03-16  1260  	if (!ph)
23934efe3748f6 Cristian Marussi 2021-03-16  1261  		return ERR_PTR(-EINVAL);
23934efe3748f6 Cristian Marussi 2021-03-16  1262  =

23934efe3748f6 Cristian Marussi 2021-03-16  1263  	dres =3D devres_alloc(sc=
mi_devm_release_protocol,
23934efe3748f6 Cristian Marussi 2021-03-16  1264  			    sizeof(*dres), GFP=
_KERNEL);
23934efe3748f6 Cristian Marussi 2021-03-16  1265  	if (!dres)
23934efe3748f6 Cristian Marussi 2021-03-16  1266  		return ERR_PTR(-ENOMEM);
23934efe3748f6 Cristian Marussi 2021-03-16  1267  =

23934efe3748f6 Cristian Marussi 2021-03-16  1268  	pi =3D scmi_get_protocol=
_instance(handle, protocol_id);
23934efe3748f6 Cristian Marussi 2021-03-16  1269  	if (IS_ERR(pi)) {
23934efe3748f6 Cristian Marussi 2021-03-16  1270  		devres_free(dres);
23934efe3748f6 Cristian Marussi 2021-03-16  1271  		return pi;
23934efe3748f6 Cristian Marussi 2021-03-16  1272  	}
23934efe3748f6 Cristian Marussi 2021-03-16  1273  =

23934efe3748f6 Cristian Marussi 2021-03-16  1274  	dres->handle =3D handle;
23934efe3748f6 Cristian Marussi 2021-03-16  1275  	dres->protocol_id =3D pr=
otocol_id;
23934efe3748f6 Cristian Marussi 2021-03-16  1276  	devres_add(&sdev->dev, d=
res);
23934efe3748f6 Cristian Marussi 2021-03-16  1277  =

23934efe3748f6 Cristian Marussi 2021-03-16 @1278  	*ph =3D &pi->ph;
23934efe3748f6 Cristian Marussi 2021-03-16  1279  =

23934efe3748f6 Cristian Marussi 2021-03-16  1280  	return pi->proto->ops;
23934efe3748f6 Cristian Marussi 2021-03-16  1281  }
23934efe3748f6 Cristian Marussi 2021-03-16  1282  =


:::::: The code at line 1278 was first introduced by commit
:::::: 23934efe3748f6d9d8ac0760178a5ef1ed8320f4 firmware: arm_scmi: Introdu=
ce devres get/put protocols operations

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4461949041769761290==--

