Content-Type: multipart/mixed; boundary="===============6167398101671281528=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/mv88e6xxx/chip.c:1852:12: warning: Uninitialized variable: mst->stu [uninitvar]
Date: Mon, 02 May 2022 06:49:54 +0800
Message-ID: <202205020601.GdJApX9p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6167398101671281528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tobias Waldekranz <tobias@waldekranz.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: acaf4d2e36b3466334af4d3ee6ac254c3316165c net: dsa: mv88e6xxx: MST O=
ffloading
date:   6 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 weeks ago
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout acaf4d2e36b3466334af4d3ee6ac254c3316165c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/ipv4/icmp.c:402:13: warning: Using argument icmp_param that points a=
t uninitialized variable icmp_param [ctuuninitvar]
    int type =3D icmp_param->data.icmph.type;
               ^
   net/ipv4/icmp.c:1006:12: note: Calling function icmp_reply, 1st argument=
 is uninitialized
    icmp_reply(&icmp_param, skb);
              ^
   net/ipv4/icmp.c:402:13: note: Using argument icmp_param
    int type =3D icmp_param->data.icmph.type;
               ^
--
>> net/ipv4/igmp.c:2073:60: warning: Parameter 'pmca' can be declared with =
const [constParameter]
   static int ip_mc_add_src(struct in_device *in_dev, __be32 *pmca, int sfm=
ode,
                                                              ^
>> net/ipv4/igmp.c:1853:10: warning: Parameter 'psfsrc' can be declared wit=
h const [constParameter]
    __be32 *psfsrc)
            ^
   net/ipv4/igmp.c:1901:60: warning: Parameter 'pmca' can be declared with =
const [constParameter]
   static int ip_mc_del_src(struct in_device *in_dev, __be32 *pmca, int sfm=
ode,
                                                              ^
   net/ipv4/igmp.c:1968:10: warning: Parameter 'psfsrc' can be declared wit=
h const [constParameter]
    __be32 *psfsrc)
            ^
>> net/ipv4/igmp.c:858:73: warning: Parameter 'srcs' can be declared with c=
onst [constParameter]
   static int igmp_xmarksources(struct ip_mc_list *pmc, int nsrcs, __be32 *=
srcs)
                                                                           ^
--
>> drivers/net/dsa/mv88e6xxx/chip.c:1852:12: warning: Uninitialized variabl=
e: mst->stu [uninitvar]
     if (mst->stu.sid !=3D sid)
              ^
   drivers/net/dsa/mv88e6xxx/chip.c:1848:6: note: Assuming condition is fal=
se
    if (!sid)
        ^
   drivers/net/dsa/mv88e6xxx/chip.c:1852:12: note: Uninitialized variable: =
mst->stu
     if (mst->stu.sid !=3D sid)
              ^
   drivers/net/dsa/mv88e6xxx/chip.c:3940:18: warning: Uninitialized variabl=
e: mdio_bus->external [uninitvar]
     if (!mdio_bus->external)
                    ^
   drivers/net/dsa/mv88e6xxx/chip.c:3941:37: warning: Uninitialized variabl=
e: bus [uninitvar]
      mv88e6xxx_g2_irq_mdio_free(chip, bus);
                                       ^
   drivers/net/dsa/mv88e6xxx/chip.c:3938:17: note: Assignment 'bus=3Dmdio_b=
us->bus', assigned value is <Uninit>
     bus =3D mdio_bus->bus;
                   ^
   drivers/net/dsa/mv88e6xxx/chip.c:3941:37: note: Uninitialized variable: =
bus
      mv88e6xxx_g2_irq_mdio_free(chip, bus);
                                       ^
>> net/ipv4/fib_trie.c:996:11: warning: Uninitialized variable: fa->fa_slen=
 [uninitvar]
     if (fa->fa_slen < slen)
             ^
   net/ipv4/fib_trie.c:988:6: note: Assuming condition is false
    if (!fah)
        ^
   net/ipv4/fib_trie.c:996:11: note: Uninitialized variable: fa->fa_slen
     if (fa->fa_slen < slen)
             ^
>> net/ipv4/fib_trie.c:1169:29: warning: Uninitialized variable: last->fa_s=
len [uninitvar]
      if (new->fa_slen < last->fa_slen)
                               ^
>> net/ipv4/fib_trie.c:2179:8: warning: Uninitialized variable: fi [uninitv=
ar]
     if (!fi)
          ^
   net/ipv4/fib_trie.c:2177:27: note: Assignment 'fi=3Dfa->fa_info', assign=
ed value is <Uninit>
     struct fib_info *fi =3D fa->fa_info;
                             ^
   net/ipv4/fib_trie.c:2179:8: note: Uninitialized variable: fi
     if (!fi)
          ^
>> net/ipv4/fib_trie.c:2185:24: warning: Uninitialized variable: fa->tb_id =
[uninitvar]
     if (tb->tb_id !=3D fa->tb_id)
                          ^
   net/ipv4/fib_trie.c:2179:7: note: Assuming condition is false
     if (!fi)
         ^
   net/ipv4/fib_trie.c:2185:24: note: Uninitialized variable: fa->tb_id
     if (tb->tb_id !=3D fa->tb_id)
                          ^
>> net/ipv4/fib_trie.c:2905:61: warning: Parameter 'v' can be declared with=
 const [constParameter]
   static void *fib_route_seq_next(struct seq_file *seq, void *v, loff_t *p=
os)
                                                               ^
   net/ipv4/fib_trie.c:2815:24: warning: Uninitialized variable: fa->fa_sle=
n [uninitvar]
          KEYLENGTH - fa->fa_slen,
                          ^
   net/ipv4/fib_trie.c:2976:48: warning: Uninitialized variable: fa->fa_sle=
n [uninitvar]
     __be32 mask =3D inet_make_mask(KEYLENGTH - fa->fa_slen);
                                                  ^
   net/ipv4/fib_trie.c:2965:8: note: Assuming condition is false
    if (v =3D=3D SEQ_START_TOKEN) {
          ^
   net/ipv4/fib_trie.c:2976:48: note: Uninitialized variable: fa->fa_slen
     __be32 mask =3D inet_make_mask(KEYLENGTH - fa->fa_slen);
                                                  ^

vim +1852 drivers/net/dsa/mv88e6xxx/chip.c

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1842  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1843  static int mv88e6xxx_mst=
_put(struct mv88e6xxx_chip *chip, u8 sid)
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1844  {
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1845  	struct mv88e6xxx_mst *m=
st, *tmp;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1846  	int err;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1847  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1848  	if (!sid)
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1849  		return 0;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1850  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1851  	list_for_each_entry_saf=
e(mst, tmp, &chip->msts, node) {
acaf4d2e36b346 Tobias Waldekranz 2022-03-16 @1852  		if (mst->stu.sid !=3D =
sid)
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1853  			continue;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1854  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1855  		if (!refcount_dec_and_=
test(&mst->refcnt))
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1856  			return 0;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1857  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1858  		mst->stu.valid =3D fal=
se;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1859  		err =3D mv88e6xxx_stu_=
loadpurge(chip, &mst->stu);
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1860  		if (err) {
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1861  			refcount_set(&mst->re=
fcnt, 1);
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1862  			return err;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1863  		}
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1864  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1865  		list_del(&mst->node);
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1866  		kfree(mst);
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1867  		return 0;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1868  	}
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1869  =

acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1870  	return -ENOENT;
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1871  }
acaf4d2e36b346 Tobias Waldekranz 2022-03-16  1872  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6167398101671281528==--

