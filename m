Content-Type: multipart/mixed; boundary="===============7473316471570445823=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [next-queue RFC 2/4] ethtool: Add support for configuring frame preemption via netlink
Date: Mon, 18 May 2020 15:27:23 +0300
Message-ID: <20200518122723.GH2078@kadam>
In-Reply-To: <20200516012948.3173993-3-vinicius.gomes@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7473316471570445823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vinicius,

url:    https://github.com/0day-ci/linux/commits/Vinicius-Costa-Gomes/ethto=
ol-Add-support-for-frame-preemption/20200516-093235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue=
.git dev-queue

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ethtool/preempt.c:152 ethnl_set_preempt() warn: variable dereferenced b=
efore check 'info' (see line 127)

# https://github.com/0day-ci/linux/commit/5d130ebd7a21741d4fda1c8829a32353e=
10d49d5
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5d130ebd7a21741d4fda1c8829a32353e10d49d5
vim +/info +152 net/ethtool/preempt.c

5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  118  int ethnl_set_preempt(=
struct sk_buff *skb, struct genl_info *info)
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  119  {
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  120  	struct nlattr *tb[ETH=
TOOL_A_LINKINFO_MAX + 1];
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  121  	struct ethtool_fp pre=
empt =3D {};
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  122  	struct ethnl_req_info=
 req_info =3D {};
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  123  	struct net_device *de=
v;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  124  	bool mod =3D false;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  125  	int ret;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  126  =

5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15 @127  	ret =3D nlmsg_parse(i=
nfo->nlhdr, GENL_HDRLEN, tb,
                                                                          ^=
^^^^^^^^^^
Unchecked dereference.

5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  128  			  ETHTOOL_A_PREEMPT=
_MAX, preempt_set_policy,
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  129  			  info->extack);
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  130  	if (ret < 0)
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  131  		return ret;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  132  =

5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  133  	ret =3D ethnl_parse_h=
eader_dev_get(&req_info,
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  134  					 tb[ETHTOOL_A_PRE=
EMPT_HEADER],
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  135  					 genl_info_net(in=
fo), info->extack,
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  136  					 true);
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  137  	if (ret < 0)
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  138  		return ret;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  139  	dev =3D req_info.dev;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  140  	ret =3D -EOPNOTSUPP;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  141  	if (!dev->ethtool_ops=
->get_preempt ||
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  142  	    !dev->ethtool_ops=
->set_preempt)
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  143  		goto out_dev;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  144  =

5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  145  	rtnl_lock();
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  146  	ret =3D ethnl_ops_beg=
in(dev);
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  147  	if (ret < 0)
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  148  		goto out_rtnl;
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  149  =

5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  150  	ret =3D dev->ethtool_=
ops->get_preempt(dev, &preempt);
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15  151  	if (ret < 0) {
5d130ebd7a2174 Vinicius Costa Gomes 2020-05-15 @152  		if (info)
                                                                ^^^^^^^^^
Check is too late to help.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7473316471570445823==--

