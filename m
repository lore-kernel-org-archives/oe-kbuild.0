Content-Type: multipart/mixed; boundary="===============3312054666342632030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7267/7959] drivers/firmware/arm_scmi/driver.c:1214 scmi_iterator_run() warn: variable dereferenced before check 'i' (see line 1210)
Date: Sat, 30 Apr 2022 07:56:11 +0800
Message-ID: <202204300741.1Vg3IhCp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3312054666342632030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: 36b6ea0fc6bcbc618fe20d33a3b529a6d0653d99 [7267/7959] firmware: arm_=
scmi: Add iterators for multi-part commands
:::::: branch date: 16 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-m031-20220429 (https://download.01.org/0day-ci/arc=
hive/20220430/202204300741.1Vg3IhCp-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/firmware/arm_scmi/driver.c:1214 scmi_iterator_run() warn: variable =
dereferenced before check 'i' (see line 1210)

vim +/i +1214 drivers/firmware/arm_scmi/driver.c

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1204  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1205  static int scmi_iterator_=
run(void *iter)
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1206  {
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1207  	int ret =3D -EINVAL;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1208  	struct scmi_iterator *i =
=3D iter;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1209  	struct scmi_iterator_sta=
te *st =3D &i->state;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30 @1210  	struct scmi_iterator_ops=
 *iops =3D i->ops;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1211  	const struct scmi_protoc=
ol_handle *ph =3D i->ph;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1212  	const struct scmi_xfer_o=
ps *xops =3D ph->xops;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1213  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30 @1214  	if (!i)
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1215  		return ret;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1216  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1217  	do {
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1218  		iops->prepare_message(i=
->msg, st->desc_index, i->priv);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1219  		ret =3D xops->do_xfer(p=
h, i->t);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1220  		if (ret)
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1221  			break;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1222  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1223  		ret =3D iops->update_st=
ate(st, i->resp, i->priv);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1224  		if (ret)
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1225  			break;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1226  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1227  		if (st->num_returned > =
st->max_resources - st->desc_index) {
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1228  			dev_err(ph->dev,
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1229  				"No. of resources can=
't exceed %d\n",
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1230  				st->max_resources);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1231  			ret =3D -EINVAL;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1232  			break;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1233  		}
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1234  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1235  		for (st->loop_idx =3D 0=
; st->loop_idx < st->num_returned;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1236  		     st->loop_idx++) {
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1237  			ret =3D iops->process_=
response(ph, i->resp, st, i->priv);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1238  			if (ret)
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1239  				goto out;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1240  		}
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1241  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1242  		st->desc_index +=3D st-=
>num_returned;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1243  		xops->reset_rx_to_maxsz=
(ph, i->t);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1244  		/*
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1245  		 * check for both retur=
ned and remaining to avoid infinite
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1246  		 * loop due to buggy fi=
rmware
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1247  		 */
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1248  	} while (st->num_returne=
d && st->num_remaining);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1249  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1250  out:
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1251  	/* Finalize and destroy =
iterator */
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1252  	xops->xfer_put(ph, i->t);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1253  	devm_kfree(ph->dev, i);
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1254  =

36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1255  	return ret;
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1256  }
36b6ea0fc6bcbc Cristian Marussi 2022-03-30  1257  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3312054666342632030==--

