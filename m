Content-Type: multipart/mixed; boundary="===============5188256839878789438=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:netdev/net-next/main 20/29] net/core/devlink.c:6392 devlink_nl_cmd_region_new() warn: inconsistent returns '&region->snapshot_lock'.
Date: Sun, 31 Jul 2022 16:01:33 +0800
Message-ID: <202207311503.QBFSGqiL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5188256839878789438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Pirko <jiri@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block netdev/net-next/main
head:   63757225a93353bc2ce4499af5501eabdbbf23f9
commit: 2dec18ad826f52658f7781ee995d236cc449b678 [20/29] net: devlink: remo=
ve region snapshots list dependency on devlink->lock
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: arc-randconfig-m041-20220731 (https://download.01.org/0day-ci/archi=
ve/20220731/202207311503.QBFSGqiL-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/devlink.c:6392 devlink_nl_cmd_region_new() warn: inconsistent retu=
rns '&region->snapshot_lock'.

Old smatch warnings:
net/core/devlink.c:7284 devlink_fmsg_prepare_skb() error: uninitialized sym=
bol 'err'.
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +6392 net/core/devlink.c

866319bb943761 Alex Vesker    2018-07-12  6270  =

b9a17abfde842b Jacob Keller   2020-03-26  6271  static int
b9a17abfde842b Jacob Keller   2020-03-26  6272  devlink_nl_cmd_region_new(s=
truct sk_buff *skb, struct genl_info *info)
b9a17abfde842b Jacob Keller   2020-03-26  6273  {
b9a17abfde842b Jacob Keller   2020-03-26  6274  	struct devlink *devlink =
=3D info->user_ptr[0];
043b3e22768d5d Jakub Kicinski 2020-05-01  6275  	struct devlink_snapshot *s=
napshot;
544e7c33ec2f80 Andrew Lunn    2020-10-04  6276  	struct devlink_port *port =
=3D NULL;
043b3e22768d5d Jakub Kicinski 2020-05-01  6277  	struct nlattr *snapshot_id=
_attr;
b9a17abfde842b Jacob Keller   2020-03-26  6278  	struct devlink_region *reg=
ion;
b9a17abfde842b Jacob Keller   2020-03-26  6279  	const char *region_name;
544e7c33ec2f80 Andrew Lunn    2020-10-04  6280  	unsigned int index;
b9a17abfde842b Jacob Keller   2020-03-26  6281  	u32 snapshot_id;
b9a17abfde842b Jacob Keller   2020-03-26  6282  	u8 *data;
b9a17abfde842b Jacob Keller   2020-03-26  6283  	int err;
b9a17abfde842b Jacob Keller   2020-03-26  6284  =

b9a17abfde842b Jacob Keller   2020-03-26  6285  	if (!info->attrs[DEVLINK_A=
TTR_REGION_NAME]) {
b9a17abfde842b Jacob Keller   2020-03-26  6286  		NL_SET_ERR_MSG_MOD(info->=
extack, "No region name provided");
b9a17abfde842b Jacob Keller   2020-03-26  6287  		return -EINVAL;
b9a17abfde842b Jacob Keller   2020-03-26  6288  	}
b9a17abfde842b Jacob Keller   2020-03-26  6289  =

b9a17abfde842b Jacob Keller   2020-03-26  6290  	region_name =3D nla_data(i=
nfo->attrs[DEVLINK_ATTR_REGION_NAME]);
544e7c33ec2f80 Andrew Lunn    2020-10-04  6291  =

544e7c33ec2f80 Andrew Lunn    2020-10-04  6292  	if (info->attrs[DEVLINK_AT=
TR_PORT_INDEX]) {
544e7c33ec2f80 Andrew Lunn    2020-10-04  6293  		index =3D nla_get_u32(inf=
o->attrs[DEVLINK_ATTR_PORT_INDEX]);
544e7c33ec2f80 Andrew Lunn    2020-10-04  6294  =

544e7c33ec2f80 Andrew Lunn    2020-10-04  6295  		port =3D devlink_port_get=
_by_index(devlink, index);
544e7c33ec2f80 Andrew Lunn    2020-10-04  6296  		if (!port)
544e7c33ec2f80 Andrew Lunn    2020-10-04  6297  			return -ENODEV;
544e7c33ec2f80 Andrew Lunn    2020-10-04  6298  	}
544e7c33ec2f80 Andrew Lunn    2020-10-04  6299  =

544e7c33ec2f80 Andrew Lunn    2020-10-04  6300  	if (port)
544e7c33ec2f80 Andrew Lunn    2020-10-04  6301  		region =3D devlink_port_r=
egion_get_by_name(port, region_name);
544e7c33ec2f80 Andrew Lunn    2020-10-04  6302  	else
b9a17abfde842b Jacob Keller   2020-03-26  6303  		region =3D devlink_region=
_get_by_name(devlink, region_name);
544e7c33ec2f80 Andrew Lunn    2020-10-04  6304  =

b9a17abfde842b Jacob Keller   2020-03-26  6305  	if (!region) {
b9a17abfde842b Jacob Keller   2020-03-26  6306  		NL_SET_ERR_MSG_MOD(info->=
extack, "The requested region does not exist");
b9a17abfde842b Jacob Keller   2020-03-26  6307  		return -EINVAL;
b9a17abfde842b Jacob Keller   2020-03-26  6308  	}
b9a17abfde842b Jacob Keller   2020-03-26  6309  =

b9a17abfde842b Jacob Keller   2020-03-26  6310  	if (!region->ops->snapshot=
) {
b9a17abfde842b Jacob Keller   2020-03-26  6311  		NL_SET_ERR_MSG_MOD(info->=
extack, "The requested region does not support taking an immediate snapshot=
");
b9a17abfde842b Jacob Keller   2020-03-26  6312  		return -EOPNOTSUPP;
b9a17abfde842b Jacob Keller   2020-03-26  6313  	}
b9a17abfde842b Jacob Keller   2020-03-26  6314  =

2dec18ad826f52 Jiri Pirko     2022-07-28  6315  	mutex_lock(&region->snapsh=
ot_lock);
2dec18ad826f52 Jiri Pirko     2022-07-28  6316  =

b9a17abfde842b Jacob Keller   2020-03-26  6317  	if (region->cur_snapshots =
=3D=3D region->max_snapshots) {
b9a17abfde842b Jacob Keller   2020-03-26  6318  		NL_SET_ERR_MSG_MOD(info->=
extack, "The region has reached the maximum number of stored snapshots");
2dec18ad826f52 Jiri Pirko     2022-07-28  6319  		err =3D -ENOSPC;
2dec18ad826f52 Jiri Pirko     2022-07-28  6320  		goto unlock;
b9a17abfde842b Jacob Keller   2020-03-26  6321  	}
b9a17abfde842b Jacob Keller   2020-03-26  6322  =

043b3e22768d5d Jakub Kicinski 2020-05-01  6323  	snapshot_id_attr =3D info-=
>attrs[DEVLINK_ATTR_REGION_SNAPSHOT_ID];
043b3e22768d5d Jakub Kicinski 2020-05-01  6324  	if (snapshot_id_attr) {
043b3e22768d5d Jakub Kicinski 2020-05-01  6325  		snapshot_id =3D nla_get_u=
32(snapshot_id_attr);
b9a17abfde842b Jacob Keller   2020-03-26  6326  =

b9a17abfde842b Jacob Keller   2020-03-26  6327  		if (devlink_region_snapsh=
ot_get_by_id(region, snapshot_id)) {
b9a17abfde842b Jacob Keller   2020-03-26  6328  			NL_SET_ERR_MSG_MOD(info-=
>extack, "The requested snapshot id is already in use");
2dec18ad826f52 Jiri Pirko     2022-07-28  6329  			err =3D -EEXIST;
2dec18ad826f52 Jiri Pirko     2022-07-28  6330  			goto unlock;
b9a17abfde842b Jacob Keller   2020-03-26  6331  		}
b9a17abfde842b Jacob Keller   2020-03-26  6332  =

b9a17abfde842b Jacob Keller   2020-03-26  6333  		err =3D __devlink_snapsho=
t_id_insert(devlink, snapshot_id);
b9a17abfde842b Jacob Keller   2020-03-26  6334  		if (err)
2dec18ad826f52 Jiri Pirko     2022-07-28  6335  			goto unlock;
043b3e22768d5d Jakub Kicinski 2020-05-01  6336  	} else {
043b3e22768d5d Jakub Kicinski 2020-05-01  6337  		err =3D __devlink_region_=
snapshot_id_get(devlink, &snapshot_id);
043b3e22768d5d Jakub Kicinski 2020-05-01  6338  		if (err) {
043b3e22768d5d Jakub Kicinski 2020-05-01  6339  			NL_SET_ERR_MSG_MOD(info-=
>extack, "Failed to allocate a new snapshot id");
2dec18ad826f52 Jiri Pirko     2022-07-28  6340  			goto unlock;
043b3e22768d5d Jakub Kicinski 2020-05-01  6341  		}
043b3e22768d5d Jakub Kicinski 2020-05-01  6342  	}
b9a17abfde842b Jacob Keller   2020-03-26  6343  =

544e7c33ec2f80 Andrew Lunn    2020-10-04  6344  	if (port)
544e7c33ec2f80 Andrew Lunn    2020-10-04  6345  		err =3D region->port_ops-=
>snapshot(port, region->port_ops,
544e7c33ec2f80 Andrew Lunn    2020-10-04  6346  						 info->extack, &data);
544e7c33ec2f80 Andrew Lunn    2020-10-04  6347  	else
544e7c33ec2f80 Andrew Lunn    2020-10-04  6348  		err =3D region->ops->snap=
shot(devlink, region->ops,
544e7c33ec2f80 Andrew Lunn    2020-10-04  6349  					    info->extack, &dat=
a);
b9a17abfde842b Jacob Keller   2020-03-26  6350  	if (err)
b9a17abfde842b Jacob Keller   2020-03-26  6351  		goto err_snapshot_capture;
b9a17abfde842b Jacob Keller   2020-03-26  6352  =

b9a17abfde842b Jacob Keller   2020-03-26  6353  	err =3D __devlink_region_s=
napshot_create(region, data, snapshot_id);
b9a17abfde842b Jacob Keller   2020-03-26  6354  	if (err)
b9a17abfde842b Jacob Keller   2020-03-26  6355  		goto err_snapshot_create;
b9a17abfde842b Jacob Keller   2020-03-26  6356  =

043b3e22768d5d Jakub Kicinski 2020-05-01  6357  	if (!snapshot_id_attr) {
043b3e22768d5d Jakub Kicinski 2020-05-01  6358  		struct sk_buff *msg;
043b3e22768d5d Jakub Kicinski 2020-05-01  6359  =

043b3e22768d5d Jakub Kicinski 2020-05-01  6360  		snapshot =3D devlink_regi=
on_snapshot_get_by_id(region,
043b3e22768d5d Jakub Kicinski 2020-05-01  6361  							     snapshot_id);
043b3e22768d5d Jakub Kicinski 2020-05-01  6362  		if (WARN_ON(!snapshot))
043b3e22768d5d Jakub Kicinski 2020-05-01  6363  			return -EINVAL;
043b3e22768d5d Jakub Kicinski 2020-05-01  6364  =

043b3e22768d5d Jakub Kicinski 2020-05-01  6365  		msg =3D devlink_nl_region=
_notify_build(region, snapshot,
043b3e22768d5d Jakub Kicinski 2020-05-01  6366  						     DEVLINK_CMD_REGI=
ON_NEW,
043b3e22768d5d Jakub Kicinski 2020-05-01  6367  						     info->snd_portid,
043b3e22768d5d Jakub Kicinski 2020-05-01  6368  						     info->snd_seq);
043b3e22768d5d Jakub Kicinski 2020-05-01  6369  		err =3D PTR_ERR_OR_ZERO(m=
sg);
043b3e22768d5d Jakub Kicinski 2020-05-01  6370  		if (err)
043b3e22768d5d Jakub Kicinski 2020-05-01  6371  			goto err_notify;
043b3e22768d5d Jakub Kicinski 2020-05-01  6372  =

043b3e22768d5d Jakub Kicinski 2020-05-01  6373  		err =3D genlmsg_reply(msg=
, info);
043b3e22768d5d Jakub Kicinski 2020-05-01  6374  		if (err)
043b3e22768d5d Jakub Kicinski 2020-05-01  6375  			goto err_notify;
043b3e22768d5d Jakub Kicinski 2020-05-01  6376  	}
043b3e22768d5d Jakub Kicinski 2020-05-01  6377  =

2dec18ad826f52 Jiri Pirko     2022-07-28  6378  	mutex_unlock(&region->snap=
shot_lock);
b9a17abfde842b Jacob Keller   2020-03-26  6379  	return 0;
b9a17abfde842b Jacob Keller   2020-03-26  6380  =

b9a17abfde842b Jacob Keller   2020-03-26  6381  err_snapshot_create:
b9a17abfde842b Jacob Keller   2020-03-26  6382  	region->ops->destructor(da=
ta);
b9a17abfde842b Jacob Keller   2020-03-26  6383  err_snapshot_capture:
b9a17abfde842b Jacob Keller   2020-03-26  6384  	__devlink_snapshot_id_decr=
ement(devlink, snapshot_id);
2dec18ad826f52 Jiri Pirko     2022-07-28  6385  	mutex_unlock(&region->snap=
shot_lock);
b9a17abfde842b Jacob Keller   2020-03-26  6386  	return err;
043b3e22768d5d Jakub Kicinski 2020-05-01  6387  =

043b3e22768d5d Jakub Kicinski 2020-05-01  6388  err_notify:
043b3e22768d5d Jakub Kicinski 2020-05-01  6389  	devlink_region_snapshot_de=
l(region, snapshot);
2dec18ad826f52 Jiri Pirko     2022-07-28  6390  unlock:
2dec18ad826f52 Jiri Pirko     2022-07-28  6391  	mutex_unlock(&region->snap=
shot_lock);
043b3e22768d5d Jakub Kicinski 2020-05-01 @6392  	return err;
b9a17abfde842b Jacob Keller   2020-03-26  6393  }
b9a17abfde842b Jacob Keller   2020-03-26  6394  =


:::::: The code at line 6392 was first introduced by commit
:::::: 043b3e22768d5d909cb1474fc21ae2fbaf026c0c devlink: let kernel allocat=
e region snapshot id

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5188256839878789438==--

