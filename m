Content-Type: multipart/mixed; boundary="===============1666439431513071856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/preempt-rt 17467/26241] net/core/rtnetlink.c:1500 rtnl_xdp_fill() warn: missing error code 'err'
Date: Sun, 21 Aug 2022 17:14:45 +0800
Message-ID: <202208211704.WsrNJ8wO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1666439431513071856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
CC: Zhou Furong <furong.zhou@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   b97f048cafa8075c428c7e576fd2ee5c28538898
commit: 1be929fc6b6c1e732163f5c3ab53d055a3429bca [17467/26241] rtnetlink: F=
ix unchecked return value of dev_xdp_query_md_btf()
:::::: branch date: 6 days ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20821/202208211704.WsrNJ8wO-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/core/rtnetlink.c:1500 rtnl_xdp_fill() warn: missing error code 'err'

vim +/err +1500 net/core/rtnetlink.c

d67b9cd28c1d7f Daniel Borkmann           2017-05-12  1460  =

d1fdd9138682e0 Brenden Blanco            2016-07-19  1461  static int rtnl_=
xdp_fill(struct sk_buff *skb, struct net_device *dev)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1462  {
26ce18bde6b36f Muhammad Husaini Zulkifli 2021-06-14  1463  	u32 prog_id, md=
_btf_id;
26ce18bde6b36f Muhammad Husaini Zulkifli 2021-06-14  1464  	u8 md_btf_enabl=
ed =3D 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1465  	struct nlattr *=
xdp;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1466  	int err;
4f91da26c81145 Jakub Kicinski            2018-07-11  1467  	u8 mode;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1468  =

ae0be8de9a53cd Michal Kubecek            2019-04-26  1469  	xdp =3D nla_nes=
t_start_noflag(skb, IFLA_XDP);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1470  	if (!xdp)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1471  		return -EMSGSI=
ZE;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1472  =

a25717d2b60434 Jakub Kicinski            2018-07-11  1473  	prog_id =3D 0;
a25717d2b60434 Jakub Kicinski            2018-07-11  1474  	mode =3D XDP_AT=
TACHED_NONE;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1475  	err =3D rtnl_xd=
p_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_SKB,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1476  				  IFLA_XDP_S=
KB_PROG_ID, rtnl_xdp_prog_skb);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1477  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1478  		goto err_cance=
l;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1479  	err =3D rtnl_xd=
p_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_DRV,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1480  				  IFLA_XDP_D=
RV_PROG_ID, rtnl_xdp_prog_drv);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1481  	if (err)
a25717d2b60434 Jakub Kicinski            2018-07-11  1482  		goto err_cance=
l;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1483  	err =3D rtnl_xd=
p_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_HW,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1484  				  IFLA_XDP_H=
W_PROG_ID, rtnl_xdp_prog_hw);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1485  	if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1486  		goto err_cance=
l;
4f91da26c81145 Jakub Kicinski            2018-07-11  1487  =

a25717d2b60434 Jakub Kicinski            2018-07-11  1488  	err =3D nla_put=
_u8(skb, IFLA_XDP_ATTACHED, mode);
b5cdae3291f7be David S. Miller           2017-04-18  1489  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1490  		goto err_cance=
l;
d67b9cd28c1d7f Daniel Borkmann           2017-05-12  1491  =

a25717d2b60434 Jakub Kicinski            2018-07-11  1492  	if (prog_id && =
mode !=3D XDP_ATTACHED_MULTI) {
58038695e62b44 Martin KaFai Lau          2017-06-15  1493  		err =3D nla_pu=
t_u32(skb, IFLA_XDP_PROG_ID, prog_id);
58038695e62b44 Martin KaFai Lau          2017-06-15  1494  		if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1495  			goto err_canc=
el;
58038695e62b44 Martin KaFai Lau          2017-06-15  1496  	}
58038695e62b44 Martin KaFai Lau          2017-06-15  1497  =

26ce18bde6b36f Muhammad Husaini Zulkifli 2021-06-14  1498  	md_btf_id =3D d=
ev_xdp_query_md_btf(dev, &md_btf_enabled);
1be929fc6b6c1e Muhammad Husaini Zulkifli 2021-07-30  1499  	if (!md_btf_id)
1be929fc6b6c1e Muhammad Husaini Zulkifli 2021-07-30 @1500  		goto err_cance=
l;
1be929fc6b6c1e Muhammad Husaini Zulkifli 2021-07-30  1501  =

26ce18bde6b36f Muhammad Husaini Zulkifli 2021-06-14  1502  	nla_put_u32(skb=
, IFLA_XDP_MD_BTF_ID, md_btf_id);
26ce18bde6b36f Muhammad Husaini Zulkifli 2021-06-14  1503  	nla_put_u8(skb,=
 IFLA_XDP_MD_BTF_STATE, md_btf_enabled);
26ce18bde6b36f Muhammad Husaini Zulkifli 2021-06-14  1504  =

d1fdd9138682e0 Brenden Blanco            2016-07-19  1505  	nla_nest_end(sk=
b, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1506  	return 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1507  =

d1fdd9138682e0 Brenden Blanco            2016-07-19  1508  err_cancel:
d1fdd9138682e0 Brenden Blanco            2016-07-19  1509  	nla_nest_cancel=
(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1510  	return err;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1511  }
d1fdd9138682e0 Brenden Blanco            2016-07-19  1512  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1666439431513071856==--

