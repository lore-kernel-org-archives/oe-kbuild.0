Content-Type: multipart/mixed; boundary="===============8347949126756920953=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:jiri_devel_components 1/3] net/core/devlink.c:6558 devlink_nl_info_fill() warn: missing error code 'err'
Date: Sat, 28 May 2022 14:00:44 +0800
Message-ID: <202205281346.ewkXalBD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8347949126756920953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_components
head:   9360f04ac2b51764d94b40113ef1b21b95835ae6
commit: e7261a9db46b29988444322b7b506954c06a7f4d [1/3] net: devlink: introd=
uce flash components list
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220528/202205281346.ewkXalBD-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/devlink.c:6558 devlink_nl_info_fill() warn: missing error code 'er=
r'

Old smatch warnings:
net/core/devlink.c:7154 devlink_fmsg_prepare_skb() error: uninitialized sym=
bol 'err'.
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +/err +6558 net/core/devlink.c

fc6fae7dd987dc Jakub Kicinski 2019-01-31  6529  =

f9cf22882c606f Jakub Kicinski 2019-01-31  6530  static int
f9cf22882c606f Jakub Kicinski 2019-01-31  6531  devlink_nl_info_fill(struct=
 sk_buff *msg, struct devlink *devlink,
f9cf22882c606f Jakub Kicinski 2019-01-31  6532  		     enum devlink_command=
 cmd, u32 portid,
f9cf22882c606f Jakub Kicinski 2019-01-31  6533  		     u32 seq, int flags, =
struct netlink_ext_ack *extack)
f9cf22882c606f Jakub Kicinski 2019-01-31  6534  {
e7261a9db46b29 Jiri Pirko     2022-05-27  6535  	struct devlink_flash_compo=
nent *component;
e7261a9db46b29 Jiri Pirko     2022-05-27  6536  	struct nlattr *component_a=
ttr;
f9cf22882c606f Jakub Kicinski 2019-01-31  6537  	struct devlink_info_req re=
q;
f9cf22882c606f Jakub Kicinski 2019-01-31  6538  	void *hdr;
f9cf22882c606f Jakub Kicinski 2019-01-31  6539  	int err;
f9cf22882c606f Jakub Kicinski 2019-01-31  6540  =

f9cf22882c606f Jakub Kicinski 2019-01-31  6541  	hdr =3D genlmsg_put(msg, p=
ortid, seq, &devlink_nl_family, flags, cmd);
f9cf22882c606f Jakub Kicinski 2019-01-31  6542  	if (!hdr)
f9cf22882c606f Jakub Kicinski 2019-01-31  6543  		return -EMSGSIZE;
f9cf22882c606f Jakub Kicinski 2019-01-31  6544  =

f9cf22882c606f Jakub Kicinski 2019-01-31  6545  	err =3D -EMSGSIZE;
f9cf22882c606f Jakub Kicinski 2019-01-31  6546  	if (devlink_nl_put_handle(=
msg, devlink))
f9cf22882c606f Jakub Kicinski 2019-01-31  6547  		goto err_cancel_msg;
f9cf22882c606f Jakub Kicinski 2019-01-31  6548  =

f9cf22882c606f Jakub Kicinski 2019-01-31  6549  	req.msg =3D msg;
f9cf22882c606f Jakub Kicinski 2019-01-31  6550  	err =3D devlink->ops->info=
_get(devlink, &req, extack);
f9cf22882c606f Jakub Kicinski 2019-01-31  6551  	if (err)
f9cf22882c606f Jakub Kicinski 2019-01-31  6552  		goto err_cancel_msg;
f9cf22882c606f Jakub Kicinski 2019-01-31  6553  =

e7261a9db46b29 Jiri Pirko     2022-05-27  6554  	mutex_lock(&devlink->compo=
nents_lock);
e7261a9db46b29 Jiri Pirko     2022-05-27  6555  	list_for_each_entry(compon=
ent, &devlink->component_list, list) {
e7261a9db46b29 Jiri Pirko     2022-05-27  6556  		component_attr =3D nla_ne=
st_start(msg, DEVLINK_ATTR_INFO_COMPONENT);
e7261a9db46b29 Jiri Pirko     2022-05-27  6557  		if (!component_attr)
e7261a9db46b29 Jiri Pirko     2022-05-27 @6558  			goto err_cancel_msg_unlo=
ck;
e7261a9db46b29 Jiri Pirko     2022-05-27  6559  		if (nla_put_string(msg, D=
EVLINK_ATTR_FLASH_UPDATE_COMPONENT,
e7261a9db46b29 Jiri Pirko     2022-05-27  6560  				   component->name))
e7261a9db46b29 Jiri Pirko     2022-05-27  6561  			goto err_cancel_msg_unlo=
ck;
e7261a9db46b29 Jiri Pirko     2022-05-27  6562  		err =3D component->info_g=
et(devlink, &req, component->priv,
e7261a9db46b29 Jiri Pirko     2022-05-27  6563  					  extack);
e7261a9db46b29 Jiri Pirko     2022-05-27  6564  		if (err)
e7261a9db46b29 Jiri Pirko     2022-05-27  6565  			goto err_cancel_msg_unlo=
ck;
e7261a9db46b29 Jiri Pirko     2022-05-27  6566  		nla_nest_end(msg, compone=
nt_attr);
e7261a9db46b29 Jiri Pirko     2022-05-27  6567  	}
e7261a9db46b29 Jiri Pirko     2022-05-27  6568  	mutex_unlock(&devlink->com=
ponents_lock);
f9cf22882c606f Jakub Kicinski 2019-01-31  6569  	genlmsg_end(msg, hdr);
f9cf22882c606f Jakub Kicinski 2019-01-31  6570  	return 0;
f9cf22882c606f Jakub Kicinski 2019-01-31  6571  =

e7261a9db46b29 Jiri Pirko     2022-05-27  6572  err_cancel_msg_unlock:
e7261a9db46b29 Jiri Pirko     2022-05-27  6573  	mutex_unlock(&devlink->com=
ponents_lock);
f9cf22882c606f Jakub Kicinski 2019-01-31  6574  err_cancel_msg:
f9cf22882c606f Jakub Kicinski 2019-01-31  6575  	genlmsg_cancel(msg, hdr);
f9cf22882c606f Jakub Kicinski 2019-01-31  6576  	return err;
f9cf22882c606f Jakub Kicinski 2019-01-31  6577  }
f9cf22882c606f Jakub Kicinski 2019-01-31  6578  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8347949126756920953==--

