Content-Type: multipart/mixed; boundary="===============8558222492555214001=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] net-zerocopy: split zerocopy receive to several parts
Date: Tue, 25 Jan 2022 00:44:18 +0800
Message-ID: <202201250056.W4B9lptZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8558222492555214001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220124094320.900713-2-haoxu@linux.alibaba.com>
References: <20220124094320.900713-2-haoxu@linux.alibaba.com>
TO: Hao Xu <haoxu@linux.alibaba.com>
TO: netdev(a)vger.kernel.org
TO: io-uring(a)vger.kernel.org
CC: Jens Axboe <axboe@kernel.dk>
CC: Pavel Begunkov <asml.silence@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: "David S . Miller" <davem@davemloft.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: David Ahern <dsahern@kernel.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>

Hi Hao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc1 next-20220124]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hao-Xu/io_uring-zerocopy-r=
eceive/20220124-174546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201250056.W4B9lptZ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/tcp.c:3951 zc_receive_check() warn: check for integer overflow 'le=
n'

vim +/len +3951 net/ipv4/tcp.c

1c885808e45601 Francis Yan 2016-11-27  3938  =

8ed32d9a0fe79a Hao Xu      2022-01-24  3939  int zc_receive_check(struct tc=
p_zerocopy_receive *zc, int *lenp,
8ed32d9a0fe79a Hao Xu      2022-01-24  3940  		     char __user *optval, in=
t __user *optlen)
8ed32d9a0fe79a Hao Xu      2022-01-24  3941  {
8ed32d9a0fe79a Hao Xu      2022-01-24  3942  	int len =3D *lenp, err;
8ed32d9a0fe79a Hao Xu      2022-01-24  3943  =

8ed32d9a0fe79a Hao Xu      2022-01-24  3944  	if (get_user(len, optlen))
8ed32d9a0fe79a Hao Xu      2022-01-24  3945  		return -EFAULT;
8ed32d9a0fe79a Hao Xu      2022-01-24  3946  	if (len < 0 ||
8ed32d9a0fe79a Hao Xu      2022-01-24  3947  	    len < offsetofend(struct =
tcp_zerocopy_receive, length))
8ed32d9a0fe79a Hao Xu      2022-01-24  3948  		return -EINVAL;
8ed32d9a0fe79a Hao Xu      2022-01-24  3949  	if (unlikely(len > sizeof(*zc=
))) {
8ed32d9a0fe79a Hao Xu      2022-01-24  3950  		err =3D check_zeroed_user(op=
tval + sizeof(*zc),
8ed32d9a0fe79a Hao Xu      2022-01-24 @3951  					len - sizeof(*zc));
8ed32d9a0fe79a Hao Xu      2022-01-24  3952  		if (err < 1)
8ed32d9a0fe79a Hao Xu      2022-01-24  3953  			return err =3D=3D 0 ? -EINV=
AL : err;
8ed32d9a0fe79a Hao Xu      2022-01-24  3954  		len =3D sizeof(*zc);
8ed32d9a0fe79a Hao Xu      2022-01-24  3955  		if (put_user(len, optlen))
8ed32d9a0fe79a Hao Xu      2022-01-24  3956  			return -EFAULT;
8ed32d9a0fe79a Hao Xu      2022-01-24  3957  	}
8ed32d9a0fe79a Hao Xu      2022-01-24  3958  	if (copy_from_user(zc, optval=
, len))
8ed32d9a0fe79a Hao Xu      2022-01-24  3959  		return -EFAULT;
8ed32d9a0fe79a Hao Xu      2022-01-24  3960  =

8ed32d9a0fe79a Hao Xu      2022-01-24  3961  	if (zc->reserved)
8ed32d9a0fe79a Hao Xu      2022-01-24  3962  		return -EINVAL;
8ed32d9a0fe79a Hao Xu      2022-01-24  3963  	if (zc->msg_flags & ~(TCP_VAL=
ID_ZC_MSG_FLAGS))
8ed32d9a0fe79a Hao Xu      2022-01-24  3964  		return -EINVAL;
8ed32d9a0fe79a Hao Xu      2022-01-24  3965  =

8ed32d9a0fe79a Hao Xu      2022-01-24  3966  	*lenp =3D len;
8ed32d9a0fe79a Hao Xu      2022-01-24  3967  	return 0;
8ed32d9a0fe79a Hao Xu      2022-01-24  3968  }
8ed32d9a0fe79a Hao Xu      2022-01-24  3969  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8558222492555214001==--

