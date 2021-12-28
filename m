Content-Type: multipart/mixed; boundary="===============6183115756673678929=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jolsa-perf:kprobe/multi 4/13] kernel/kprobes.c:1685 check_ftrace_multi() error: uninitialized symbol 'err'.
Date: Wed, 29 Dec 2021 00:12:51 +0800
Message-ID: <202112290028.kqVCCoGF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6183115756673678929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git kpro=
be/multi
head:   bc59262730d5cfc95d6cae84f247d2e8690a309b
commit: 9ea9f7bc2b16659a9932cc80aed62216856c111e [4/13] kprobe: Add support=
 to register multiple ftrace kprobes
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-m021-20211228 (https://download.01.org/0day-ci/arch=
ive/20211229/202112290028.kqVCCoGF-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/kprobes.c:1685 check_ftrace_multi() error: uninitialized symbol 'err=
'.

vim +/err +1685 kernel/kprobes.c

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1645  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1646  static int check_ftrace_multi(st=
ruct kprobe *p)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1647  {
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1648  	kprobe_opcode_t **addrs =3D p->=
multi.addrs;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1649  	const char **symbols =3D p->mul=
ti.symbols;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1650  	unsigned int i, cnt =3D p->mult=
i.cnt;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1651  	unsigned long addr, *ips;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1652  	int err;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1653  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1654  	if ((symbols && addrs) || (!sym=
bols && !addrs))
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1655  		return -EINVAL;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1656  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1657  	/* do we want sysctl for this? =
*/
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1658  	if (cnt >=3D 20000)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1659  		return -E2BIG;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1660  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1661  	ips =3D kmalloc(sizeof(*ips) * =
cnt, GFP_KERNEL);
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1662  	if (!ips)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1663  		return -ENOMEM;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1664  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1665  	for (i =3D 0; i < cnt; i++) {
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1666  		if (symbols)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1667  			addr =3D (unsigned long) kpro=
be_lookup_name(symbols[i], 0);
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1668  		else
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1669  			addr =3D (unsigned long) addr=
s[i];
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1670  		ips[i] =3D addr;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1671  	}
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1672  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1673  	jump_label_lock();
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1674  	preempt_disable();
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1675  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1676  	for (i =3D 0; i < cnt; i++) {
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1677  		err =3D check_ftrace_addr(ips[=
i]);
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1678  		if (err)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1679  			break;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1680  	}
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1681  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1682  	preempt_enable();
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1683  	jump_label_unlock();
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1684  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12 @1685  	if (err)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1686  		goto out;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1687  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1688  	err =3D ftrace_set_filter_ips(&=
p->multi.ops, ips, cnt, 0, 0);
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1689  	if (err)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1690  		goto out;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1691  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1692  	p->multi.ops.func =3D kprobe_ft=
race_multi_handler;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1693  	p->multi.ops.flags =3D FTRACE_O=
PS_FL_SAVE_REGS|FTRACE_OPS_FL_DYNAMIC;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1694  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1695  	p->flags |=3D KPROBE_FLAG_MULTI=
|KPROBE_FLAG_FTRACE;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1696  	if (p->post_handler)
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1697  		p->multi.ops.flags |=3D FTRACE=
_OPS_FL_IPMODIFY;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1698  =

9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1699  out:
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1700  	kfree(ips);
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1701  	return err;
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1702  }
9ea9f7bc2b1665 Jiri Olsa 2021-12-12  1703  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6183115756673678929==--

