Content-Type: multipart/mixed; boundary="===============4513047798103417552=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:6357:1: warning: There is an unknown macro here somewhere. Configuration is required. If BTF_ID_LIST_GLOBAL is a macro then please configure it. [unknownMacro]
Date: Fri, 01 Apr 2022 05:59:55 +0800
Message-ID: <202204010555.QhERif3O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4513047798103417552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Song Liu <songliubraving@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e729dbe8ea1c6145ae7b9efd6a00a5613746d3b0
commit: d19ddb476a539fd78ad1028ae13bb38506286931 bpf: Introduce btf_tracing=
_ids
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> net/core/rtnetlink.c:5220:9: warning: Local variable 'err' shadows outer=
 variable [shadowVariable]
       int err;
           ^
   net/core/rtnetlink.c:5120:6: note: Shadowed declaration
    int err;
        ^
   net/core/rtnetlink.c:5220:9: note: Shadow variable
       int err;
           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/rtnetlink.c:4846:6: warning: Redundant initialization for 'err'=
. The initialized value is overwritten before it is read. [redundantInitial=
ization]
    err =3D dev->netdev_ops->ndo_bridge_getlink(skb, 0, 0, dev, 0, 0);
        ^
   net/core/rtnetlink.c:4835:10: note: err is initialized
    int err =3D -EOPNOTSUPP;
            ^
   net/core/rtnetlink.c:4846:6: note: err is overwritten
    err =3D dev->netdev_ops->ndo_bridge_getlink(skb, 0, 0, dev, 0, 0);
        ^
>> net/core/rtnetlink.c:2238:52: warning: Parameter 'tb' can be declared wi=
th const [constParameter]
   static int rtnl_ensure_unique_netns(struct nlattr *tb[],
                                                      ^
--
>> kernel/bpf/btf.c:6357:1: warning: There is an unknown macro here somewhe=
re. Configuration is required. If BTF_ID_LIST_GLOBAL is a macro then please=
 configure it. [unknownMacro]
   BTF_ID_LIST_GLOBAL(btf_tracing_ids, MAX_BTF_TRACING_TYPE)
   ^
--
>> net/core/dev.c:1651:2: warning: There is an unknown macro here somewhere=
. Configuration is required. If netdev_for_each_lower_dev is a macro then p=
lease configure it. [unknownMacro]
    netdev_for_each_lower_dev(dev, lower_dev, iter)
    ^

vim +6357 kernel/bpf/btf.c

eb529c5b10b940 Daniel Xu               2021-08-25  6356  =

d19ddb476a539f Song Liu                2021-11-12 @6357  BTF_ID_LIST_GLOBAL=
(btf_tracing_ids, MAX_BTF_TRACING_TYPE)
d19ddb476a539f Song Liu                2021-11-12  6358  #define BTF_TRACIN=
G_TYPE(name, type) BTF_ID(struct, type)
d19ddb476a539f Song Liu                2021-11-12  6359  BTF_TRACING_TYPE_x=
xx
d19ddb476a539f Song Liu                2021-11-12  6360  #undef BTF_TRACING=
_TYPE
14f267d95fe4b0 Kumar Kartikeya Dwivedi 2021-10-02  6361  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4513047798103417552==--

