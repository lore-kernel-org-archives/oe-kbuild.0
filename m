Content-Type: multipart/mixed; boundary="===============0639945777810455455=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 05/13] bpf: implement bpf iterator for hash maps
Date: Tue, 14 Jul 2020 15:08:34 +0800
Message-ID: <202007141503.CsCS1QZ9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0639945777810455455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200713161744.3076960-1-yhs@fb.com>
References: <20200713161744.3076960-1-yhs@fb.com>
TO: Yonghong Song <yhs@fb.com>
TO: bpf(a)vger.kernel.org
TO: netdev(a)vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: kernel-team(a)fb.com
CC: Martin KaFai Lau <kafai@fb.com>

Hi Yonghong,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Yonghong-Song/bpf-implemen=
t-bpf-iterator-for-map-elements/20200714-002048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: microblaze-randconfig-s031-20200714 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-41-g14e84ffc-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/bpf/hashtab.c:622:19: sparse: sparse: subtraction of functions? S=
hare your drugs
   kernel/bpf/hashtab.c:663:19: sparse: sparse: subtraction of functions? S=
hare your drugs
   kernel/bpf/hashtab.c:1345:24: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected void *ubatch @@     got void=
 [noderef] __user * @@
   kernel/bpf/hashtab.c:1345:24: sparse:     expected void *ubatch
   kernel/bpf/hashtab.c:1345:24: sparse:     got void [noderef] __user *
   kernel/bpf/hashtab.c:1374:46: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void const [noderef] __user *=
from @@     got void *ubatch @@
   kernel/bpf/hashtab.c:1374:46: sparse:     expected void const [noderef] =
__user *from
   kernel/bpf/hashtab.c:1374:46: sparse:     got void *ubatch
   kernel/bpf/hashtab.c:1535:16: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@     expected void *ubatch @@     got void =
[noderef] __user * @@
   kernel/bpf/hashtab.c:1535:16: sparse:     expected void *ubatch
   kernel/bpf/hashtab.c:1535:16: sparse:     got void [noderef] __user *
   kernel/bpf/hashtab.c:1536:26: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void [noderef] __user *to @@ =
    got void *ubatch @@
   kernel/bpf/hashtab.c:1536:26: sparse:     expected void [noderef] __user=
 *to
   kernel/bpf/hashtab.c:1536:26: sparse:     got void *ubatch
   kernel/bpf/hashtab.c:2075:19: sparse: sparse: subtraction of functions? =
Share your drugs
   kernel/bpf/hashtab.c:1407:9: sparse: sparse: context imbalance in '__hta=
b_map_lookup_and_delete_batch' - different lock contexts for basic block
>> kernel/bpf/hashtab.c:1649:17: sparse: sparse: context imbalance in 'bpf_=
hash_map_seq_find_next' - unexpected unlock
>> kernel/bpf/hashtab.c:1753:35: sparse: sparse: context imbalance in 'bpf_=
hash_map_seq_stop' - unexpected unlock

# https://github.com/0day-ci/linux/commit/6d3930f639dd699e23551c0fb98a74a0a=
413d2a9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 6d3930f639dd699e23551c0fb98a74a0a413d2a9
vim +/bpf_hash_map_seq_find_next +1649 kernel/bpf/hashtab.c

6d3930f639dd69 Yonghong Song 2020-07-13  1623  =

6d3930f639dd69 Yonghong Song 2020-07-13  1624  static struct htab_elem *
6d3930f639dd69 Yonghong Song 2020-07-13  1625  bpf_hash_map_seq_find_next(s=
truct bpf_iter_seq_hash_map_info *info,
6d3930f639dd69 Yonghong Song 2020-07-13  1626  			   struct htab_elem *prev=
_elem)
6d3930f639dd69 Yonghong Song 2020-07-13  1627  {
6d3930f639dd69 Yonghong Song 2020-07-13  1628  	const struct bpf_htab *htab=
 =3D info->htab;
6d3930f639dd69 Yonghong Song 2020-07-13  1629  	unsigned long flags =3D inf=
o->flags;
6d3930f639dd69 Yonghong Song 2020-07-13  1630  	u32 skip_elems =3D info->sk=
ip_elems;
6d3930f639dd69 Yonghong Song 2020-07-13  1631  	u32 bucket_id =3D info->buc=
ket_id;
6d3930f639dd69 Yonghong Song 2020-07-13  1632  	struct hlist_nulls_head *he=
ad;
6d3930f639dd69 Yonghong Song 2020-07-13  1633  	struct hlist_nulls_node *n;
6d3930f639dd69 Yonghong Song 2020-07-13  1634  	struct htab_elem *elem;
6d3930f639dd69 Yonghong Song 2020-07-13  1635  	struct bucket *b;
6d3930f639dd69 Yonghong Song 2020-07-13  1636  	u32 i, count;
6d3930f639dd69 Yonghong Song 2020-07-13  1637  =

6d3930f639dd69 Yonghong Song 2020-07-13  1638  	if (bucket_id >=3D htab->n_=
buckets)
6d3930f639dd69 Yonghong Song 2020-07-13  1639  		return NULL;
6d3930f639dd69 Yonghong Song 2020-07-13  1640  =

6d3930f639dd69 Yonghong Song 2020-07-13  1641  	/* try to find next elem in=
 the same bucket */
6d3930f639dd69 Yonghong Song 2020-07-13  1642  	if (prev_elem) {
6d3930f639dd69 Yonghong Song 2020-07-13  1643  		n =3D rcu_dereference_raw(=
hlist_nulls_next_rcu(&prev_elem->hash_node));
6d3930f639dd69 Yonghong Song 2020-07-13  1644  		elem =3D hlist_nulls_entry=
_safe(n, struct htab_elem, hash_node);
6d3930f639dd69 Yonghong Song 2020-07-13  1645  		if (elem)
6d3930f639dd69 Yonghong Song 2020-07-13  1646  			return elem;
6d3930f639dd69 Yonghong Song 2020-07-13  1647  =

6d3930f639dd69 Yonghong Song 2020-07-13  1648  		/* not found, unlock and g=
o to the next bucket */
6d3930f639dd69 Yonghong Song 2020-07-13 @1649  		b =3D &htab->buckets[bucke=
t_id++];
6d3930f639dd69 Yonghong Song 2020-07-13  1650  		htab_unlock_bucket(htab, b=
, flags);
6d3930f639dd69 Yonghong Song 2020-07-13  1651  		skip_elems =3D 0;
6d3930f639dd69 Yonghong Song 2020-07-13  1652  	}
6d3930f639dd69 Yonghong Song 2020-07-13  1653  =

6d3930f639dd69 Yonghong Song 2020-07-13  1654  	for (i =3D bucket_id; i < h=
tab->n_buckets; i++) {
6d3930f639dd69 Yonghong Song 2020-07-13  1655  		b =3D &htab->buckets[i];
6d3930f639dd69 Yonghong Song 2020-07-13  1656  		flags =3D htab_lock_bucket=
(htab, b);
6d3930f639dd69 Yonghong Song 2020-07-13  1657  =

6d3930f639dd69 Yonghong Song 2020-07-13  1658  		count =3D 0;
6d3930f639dd69 Yonghong Song 2020-07-13  1659  		head =3D &b->head;
6d3930f639dd69 Yonghong Song 2020-07-13  1660  		hlist_nulls_for_each_entry=
_rcu(elem, n, head, hash_node) {
6d3930f639dd69 Yonghong Song 2020-07-13  1661  			if (count >=3D skip_elems=
) {
6d3930f639dd69 Yonghong Song 2020-07-13  1662  				info->flags =3D flags;
6d3930f639dd69 Yonghong Song 2020-07-13  1663  				info->bucket_id =3D i;
6d3930f639dd69 Yonghong Song 2020-07-13  1664  				info->skip_elems =3D cou=
nt;
6d3930f639dd69 Yonghong Song 2020-07-13  1665  				return elem;
6d3930f639dd69 Yonghong Song 2020-07-13  1666  			}
6d3930f639dd69 Yonghong Song 2020-07-13  1667  			count++;
6d3930f639dd69 Yonghong Song 2020-07-13  1668  		}
6d3930f639dd69 Yonghong Song 2020-07-13  1669  =

6d3930f639dd69 Yonghong Song 2020-07-13  1670  		htab_unlock_bucket(htab, b=
, flags);
6d3930f639dd69 Yonghong Song 2020-07-13  1671  		skip_elems =3D 0;
6d3930f639dd69 Yonghong Song 2020-07-13  1672  	}
6d3930f639dd69 Yonghong Song 2020-07-13  1673  =

6d3930f639dd69 Yonghong Song 2020-07-13  1674  	info->bucket_id =3D i;
6d3930f639dd69 Yonghong Song 2020-07-13  1675  	info->skip_elems =3D 0;
6d3930f639dd69 Yonghong Song 2020-07-13  1676  	return NULL;
6d3930f639dd69 Yonghong Song 2020-07-13  1677  }
6d3930f639dd69 Yonghong Song 2020-07-13  1678  =

6d3930f639dd69 Yonghong Song 2020-07-13  1679  static void *bpf_hash_map_se=
q_start(struct seq_file *seq, loff_t *pos)
6d3930f639dd69 Yonghong Song 2020-07-13  1680  {
6d3930f639dd69 Yonghong Song 2020-07-13  1681  	struct bpf_iter_seq_hash_ma=
p_info *info =3D seq->private;
6d3930f639dd69 Yonghong Song 2020-07-13  1682  	struct htab_elem *elem;
6d3930f639dd69 Yonghong Song 2020-07-13  1683  =

6d3930f639dd69 Yonghong Song 2020-07-13  1684  	elem =3D bpf_hash_map_seq_f=
ind_next(info, NULL);
6d3930f639dd69 Yonghong Song 2020-07-13  1685  	if (!elem)
6d3930f639dd69 Yonghong Song 2020-07-13  1686  		return NULL;
6d3930f639dd69 Yonghong Song 2020-07-13  1687  =

6d3930f639dd69 Yonghong Song 2020-07-13  1688  	if (*pos =3D=3D 0)
6d3930f639dd69 Yonghong Song 2020-07-13  1689  		++*pos;
6d3930f639dd69 Yonghong Song 2020-07-13  1690  	return elem;
6d3930f639dd69 Yonghong Song 2020-07-13  1691  }
6d3930f639dd69 Yonghong Song 2020-07-13  1692  =

6d3930f639dd69 Yonghong Song 2020-07-13  1693  static void *bpf_hash_map_se=
q_next(struct seq_file *seq, void *v, loff_t *pos)
6d3930f639dd69 Yonghong Song 2020-07-13  1694  {
6d3930f639dd69 Yonghong Song 2020-07-13  1695  	struct bpf_iter_seq_hash_ma=
p_info *info =3D seq->private;
6d3930f639dd69 Yonghong Song 2020-07-13  1696  =

6d3930f639dd69 Yonghong Song 2020-07-13  1697  	++*pos;
6d3930f639dd69 Yonghong Song 2020-07-13  1698  	++info->skip_elems;
6d3930f639dd69 Yonghong Song 2020-07-13  1699  	return bpf_hash_map_seq_fin=
d_next(info, v);
6d3930f639dd69 Yonghong Song 2020-07-13  1700  }
6d3930f639dd69 Yonghong Song 2020-07-13  1701  =

6d3930f639dd69 Yonghong Song 2020-07-13  1702  static int __bpf_hash_map_se=
q_show(struct seq_file *seq, struct htab_elem *elem)
6d3930f639dd69 Yonghong Song 2020-07-13  1703  {
6d3930f639dd69 Yonghong Song 2020-07-13  1704  	struct bpf_iter_seq_hash_ma=
p_info *info =3D seq->private;
6d3930f639dd69 Yonghong Song 2020-07-13  1705  	u32 roundup_key_size, round=
up_value_size;
6d3930f639dd69 Yonghong Song 2020-07-13  1706  	struct bpf_iter__bpf_map_el=
em ctx =3D {};
6d3930f639dd69 Yonghong Song 2020-07-13  1707  	struct bpf_map *map =3D inf=
o->map;
6d3930f639dd69 Yonghong Song 2020-07-13  1708  	struct bpf_iter_meta meta;
6d3930f639dd69 Yonghong Song 2020-07-13  1709  	int ret =3D 0, off =3D 0, c=
pu;
6d3930f639dd69 Yonghong Song 2020-07-13  1710  	struct bpf_prog *prog;
6d3930f639dd69 Yonghong Song 2020-07-13  1711  	void __percpu *pptr;
6d3930f639dd69 Yonghong Song 2020-07-13  1712  =

6d3930f639dd69 Yonghong Song 2020-07-13  1713  	meta.seq =3D seq;
6d3930f639dd69 Yonghong Song 2020-07-13  1714  	prog =3D bpf_iter_get_info(=
&meta, elem =3D=3D NULL);
6d3930f639dd69 Yonghong Song 2020-07-13  1715  	if (prog) {
6d3930f639dd69 Yonghong Song 2020-07-13  1716  		ctx.meta =3D &meta;
6d3930f639dd69 Yonghong Song 2020-07-13  1717  		ctx.map =3D info->map;
6d3930f639dd69 Yonghong Song 2020-07-13  1718  		if (elem) {
6d3930f639dd69 Yonghong Song 2020-07-13  1719  			roundup_key_size =3D roun=
d_up(map->key_size, 8);
6d3930f639dd69 Yonghong Song 2020-07-13  1720  			ctx.key =3D elem->key;
6d3930f639dd69 Yonghong Song 2020-07-13  1721  			if (!info->percpu_value_b=
uf) {
6d3930f639dd69 Yonghong Song 2020-07-13  1722  				ctx.value =3D elem->key =
+ roundup_key_size;
6d3930f639dd69 Yonghong Song 2020-07-13  1723  			} else {
6d3930f639dd69 Yonghong Song 2020-07-13  1724  				roundup_value_size =3D r=
ound_up(map->value_size, 8);
6d3930f639dd69 Yonghong Song 2020-07-13  1725  				pptr =3D htab_elem_get_p=
tr(elem, map->key_size);
6d3930f639dd69 Yonghong Song 2020-07-13  1726  				for_each_possible_cpu(cp=
u) {
6d3930f639dd69 Yonghong Song 2020-07-13  1727  					bpf_long_memcpy(info->p=
ercpu_value_buf + off,
6d3930f639dd69 Yonghong Song 2020-07-13  1728  							per_cpu_ptr(pptr, cpu=
),
6d3930f639dd69 Yonghong Song 2020-07-13  1729  							roundup_value_size);
6d3930f639dd69 Yonghong Song 2020-07-13  1730  					off +=3D roundup_value_=
size;
6d3930f639dd69 Yonghong Song 2020-07-13  1731  				}
6d3930f639dd69 Yonghong Song 2020-07-13  1732  				ctx.value =3D info->perc=
pu_value_buf;
6d3930f639dd69 Yonghong Song 2020-07-13  1733  			}
6d3930f639dd69 Yonghong Song 2020-07-13  1734  		}
6d3930f639dd69 Yonghong Song 2020-07-13  1735  		ret =3D bpf_iter_run_prog(=
prog, &ctx);
6d3930f639dd69 Yonghong Song 2020-07-13  1736  	}
6d3930f639dd69 Yonghong Song 2020-07-13  1737  =

6d3930f639dd69 Yonghong Song 2020-07-13  1738  	return ret;
6d3930f639dd69 Yonghong Song 2020-07-13  1739  }
6d3930f639dd69 Yonghong Song 2020-07-13  1740  =

6d3930f639dd69 Yonghong Song 2020-07-13  1741  static int bpf_hash_map_seq_=
show(struct seq_file *seq, void *v)
6d3930f639dd69 Yonghong Song 2020-07-13  1742  {
6d3930f639dd69 Yonghong Song 2020-07-13  1743  	return __bpf_hash_map_seq_s=
how(seq, v);
6d3930f639dd69 Yonghong Song 2020-07-13  1744  }
6d3930f639dd69 Yonghong Song 2020-07-13  1745  =

6d3930f639dd69 Yonghong Song 2020-07-13  1746  static void bpf_hash_map_seq=
_stop(struct seq_file *seq, void *v)
6d3930f639dd69 Yonghong Song 2020-07-13  1747  {
6d3930f639dd69 Yonghong Song 2020-07-13  1748  	struct bpf_iter_seq_hash_ma=
p_info *info =3D seq->private;
6d3930f639dd69 Yonghong Song 2020-07-13  1749  =

6d3930f639dd69 Yonghong Song 2020-07-13  1750  	if (!v)
6d3930f639dd69 Yonghong Song 2020-07-13  1751  		(void)__bpf_hash_map_seq_s=
how(seq, NULL);
6d3930f639dd69 Yonghong Song 2020-07-13  1752  	else
6d3930f639dd69 Yonghong Song 2020-07-13 @1753  		htab_unlock_bucket(info->h=
tab,
6d3930f639dd69 Yonghong Song 2020-07-13  1754  				   &info->htab->buckets[=
info->bucket_id],
6d3930f639dd69 Yonghong Song 2020-07-13  1755  				   info->flags);
6d3930f639dd69 Yonghong Song 2020-07-13  1756  }
6d3930f639dd69 Yonghong Song 2020-07-13  1757  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0639945777810455455==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
x2W0mAEA
--===============0639945777810455455==--

