Content-Type: multipart/mixed; boundary="===============3823073987874774927=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/driver.c:815:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Sat, 05 Jun 2021 01:10:28 +0800
Message-ID: <202106050126.AVOetgkR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3823073987874774927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f88cd3fb9df228e5ce4e13ec3dbad671ddb2146e
commit: 23934efe3748f6d9d8ac0760178a5ef1ed8320f4 firmware: arm_scmi: Introd=
uce devres get/put protocols operations
date:   10 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 weeks ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/driver.c:815:2: warning: Address of local auto=
-variable assigned to a function parameter. [autoVariables]
    *ph =3D &pi->ph;
    ^

vim +815 drivers/firmware/arm_scmi/driver.c

23934efe3748f6 Cristian Marussi 2021-03-16  770  =

23934efe3748f6 Cristian Marussi 2021-03-16  771  /**
23934efe3748f6 Cristian Marussi 2021-03-16  772   * scmi_devm_protocol_get =
 - Devres managed get protocol operations and handle
23934efe3748f6 Cristian Marussi 2021-03-16  773   * @sdev: A reference to a=
n scmi_device whose embedded struct device is to
23934efe3748f6 Cristian Marussi 2021-03-16  774   *	  be used for devres ac=
counting.
23934efe3748f6 Cristian Marussi 2021-03-16  775   * @protocol_id: The proto=
col being requested.
23934efe3748f6 Cristian Marussi 2021-03-16  776   * @ph: A pointer referenc=
e used to pass back the associated protocol handle.
23934efe3748f6 Cristian Marussi 2021-03-16  777   *
23934efe3748f6 Cristian Marussi 2021-03-16  778   * Get hold of a protocol =
accounting for its usage, eventually triggering its
23934efe3748f6 Cristian Marussi 2021-03-16  779   * initialization, and ret=
urning the protocol specific operations and related
23934efe3748f6 Cristian Marussi 2021-03-16  780   * protocol handle which w=
ill be used as first argument in most of the
23934efe3748f6 Cristian Marussi 2021-03-16  781   * protocols operations me=
thods.
23934efe3748f6 Cristian Marussi 2021-03-16  782   * Being a devres based ma=
naged method, protocol hold will be automatically
23934efe3748f6 Cristian Marussi 2021-03-16  783   * released, and possibly =
de-initialized on last user, once the SCMI driver
23934efe3748f6 Cristian Marussi 2021-03-16  784   * owning the scmi_device =
is unbound from it.
23934efe3748f6 Cristian Marussi 2021-03-16  785   *
23934efe3748f6 Cristian Marussi 2021-03-16  786   * Return: A reference to =
the requested protocol operations or error.
23934efe3748f6 Cristian Marussi 2021-03-16  787   *	   Must be checked for =
errors by caller.
23934efe3748f6 Cristian Marussi 2021-03-16  788   */
23934efe3748f6 Cristian Marussi 2021-03-16  789  static const void __must_c=
heck *
23934efe3748f6 Cristian Marussi 2021-03-16  790  scmi_devm_protocol_get(str=
uct scmi_device *sdev, u8 protocol_id,
23934efe3748f6 Cristian Marussi 2021-03-16  791  		       struct scmi_proto=
col_handle **ph)
23934efe3748f6 Cristian Marussi 2021-03-16  792  {
23934efe3748f6 Cristian Marussi 2021-03-16  793  	struct scmi_protocol_inst=
ance *pi;
23934efe3748f6 Cristian Marussi 2021-03-16  794  	struct scmi_protocol_devr=
es *dres;
23934efe3748f6 Cristian Marussi 2021-03-16  795  	struct scmi_handle *handl=
e =3D sdev->handle;
23934efe3748f6 Cristian Marussi 2021-03-16  796  =

23934efe3748f6 Cristian Marussi 2021-03-16  797  	if (!ph)
23934efe3748f6 Cristian Marussi 2021-03-16  798  		return ERR_PTR(-EINVAL);
23934efe3748f6 Cristian Marussi 2021-03-16  799  =

23934efe3748f6 Cristian Marussi 2021-03-16  800  	dres =3D devres_alloc(scm=
i_devm_release_protocol,
23934efe3748f6 Cristian Marussi 2021-03-16  801  			    sizeof(*dres), GFP_=
KERNEL);
23934efe3748f6 Cristian Marussi 2021-03-16  802  	if (!dres)
23934efe3748f6 Cristian Marussi 2021-03-16  803  		return ERR_PTR(-ENOMEM);
23934efe3748f6 Cristian Marussi 2021-03-16  804  =

23934efe3748f6 Cristian Marussi 2021-03-16  805  	pi =3D scmi_get_protocol_=
instance(handle, protocol_id);
23934efe3748f6 Cristian Marussi 2021-03-16  806  	if (IS_ERR(pi)) {
23934efe3748f6 Cristian Marussi 2021-03-16  807  		devres_free(dres);
23934efe3748f6 Cristian Marussi 2021-03-16  808  		return pi;
23934efe3748f6 Cristian Marussi 2021-03-16  809  	}
23934efe3748f6 Cristian Marussi 2021-03-16  810  =

23934efe3748f6 Cristian Marussi 2021-03-16  811  	dres->handle =3D handle;
23934efe3748f6 Cristian Marussi 2021-03-16  812  	dres->protocol_id =3D pro=
tocol_id;
23934efe3748f6 Cristian Marussi 2021-03-16  813  	devres_add(&sdev->dev, dr=
es);
23934efe3748f6 Cristian Marussi 2021-03-16  814  =

23934efe3748f6 Cristian Marussi 2021-03-16 @815  	*ph =3D &pi->ph;
23934efe3748f6 Cristian Marussi 2021-03-16  816  =

23934efe3748f6 Cristian Marussi 2021-03-16  817  	return pi->proto->ops;
23934efe3748f6 Cristian Marussi 2021-03-16  818  }
23934efe3748f6 Cristian Marussi 2021-03-16  819  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3823073987874774927==--

