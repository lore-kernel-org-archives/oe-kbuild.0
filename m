Content-Type: multipart/mixed; boundary="===============7703965174989088951=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 35/44] fs/netfs/buffered_write.c:87:34: warning: Parameter '_target' can be declared with const [constParameter]
Date: Sat, 23 Apr 2022 17:39:53 +0800
Message-ID: <202204231751.mBg6xhyn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7703965174989088951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
maple
head:   931e50676c6598d0eda1954ead465519ff91874d
commit: f343507aeda88b2f1a528a659b8fadaa9b6b0f79 [35/44] netfs: Implement b=
uffered writes through netfs_file_write_iter()
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f343507aeda88b2f1a528a659b8fadaa9b6b0f79
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/netfs/buffered_write.c:87:34: warning: Parameter '_target' can be dec=
lared with const [constParameter]
        struct netfs_dirty_region **_target,
                                    ^
--
>> lib/maple_tree.c:324:2: warning: Assignment of function parameter has no=
 effect outside the function. Did you forget dereferencing it? [uselessAssi=
gnmentPtrArg]
    node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
    ^
   lib/maple_tree.c:329:2: warning: Assignment of function parameter has no=
 effect outside the function. Did you forget dereferencing it? [uselessAssi=
gnmentPtrArg]
    node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
    ^
>> lib/maple_tree.c:1856:21: warning: Array index 'split' is used before li=
mits check. [arrayIndexThenCheck]
     while (((bn->pivot[split] - min) < slot_count - 1) &&
                       ^
>> lib/maple_tree.c:4215:23: warning: Boolean result is used in bitwise ope=
ration. Clarify expression with parentheses. [clarifyCondition]
     if (!!wr_mas->entry ^ !!wr_mas->content)
                         ^
>> lib/maple_tree.c:4179:15: warning: The if condition is the same as the p=
revious if condition [duplicateCondition]
     if (new_end < node_pivots)
                 ^
   lib/maple_tree.c:4176:15: note: First condition
     if (new_end < node_pivots)
                 ^
   lib/maple_tree.c:4179:15: note: Second condition
     if (new_end < node_pivots)
                 ^
>> lib/maple_tree.c:3077:22: warning: Found suspicious operator ',' [constS=
tatement]
    void __rcu **l_slots, **slots;
                        ^
>> lib/maple_tree.c:692:59: warning: Parameter 'pivots' can be declared wit=
h const [constParameter]
   mas_safe_pivot(const struct ma_state *mas, unsigned long *pivots,
                                                             ^
   lib/maple_tree.c:710:51: warning: Parameter 'pivots' can be declared wit=
h const [constParameter]
   mas_safe_min(struct ma_state *mas, unsigned long *pivots, unsigned char =
offset)
                                                     ^
   lib/maple_tree.c:1368:21: warning: Parameter 'pivots' can be declared wi=
th const [constParameter]
        unsigned long *pivots,
                       ^
>> lib/maple_tree.c:1507:52: warning: Parameter 'gaps' can be declared with=
 const [constParameter]
   ma_max_gap(struct maple_node *node, unsigned long *gaps, enum maple_type=
 mt,
                                                      ^
   lib/maple_tree.c:1939:43: warning: Parameter 'pivots' can be declared wi=
th const [constParameter]
     struct maple_node *node, unsigned long *pivots,
                                             ^
>> lib/maple_tree.c:2019:55: warning: Parameter 'mas' can be declared with =
const [constParameter]
   static inline void mas_descend_adopt(struct ma_state *mas)
                                                         ^
>> lib/maple_tree.c:3125:11: warning: Size of pointer 'pivs' used instead o=
f size of its data. [pointerSize]
      memset(pivs + tmp, 0,
             ^

vim +/_target +87 fs/netfs/buffered_write.c

f343507aeda88b David Howells 2021-06-17   79  =

f343507aeda88b David Howells 2021-06-17   80  /*
f343507aeda88b David Howells 2021-06-17   81   * Subsume the modifications =
into an existing target region.  Returns true if
f343507aeda88b David Howells 2021-06-17   82   * we need to update the dirt=
y_regions tree.
f343507aeda88b David Howells 2021-06-17   83   */
f343507aeda88b David Howells 2021-06-17   84  static bool netfs_subsume_int=
o_existing(struct netfs_i_context *ctx,
f343507aeda88b David Howells 2021-06-17   85  					struct folio *folio,
f343507aeda88b David Howells 2021-06-17   86  					struct ma_state *mas,
f343507aeda88b David Howells 2021-06-17  @87  					struct netfs_dirty_regio=
n **_target,
f343507aeda88b David Howells 2021-06-17   88  					struct netfs_dirty_regio=
n **_to_put,
f343507aeda88b David Howells 2021-06-17   89  					pgoff_t *_first, pgoff_t=
 *_last,
f343507aeda88b David Howells 2021-06-17   90  					size_t offset, size_t le=
n)
f343507aeda88b David Howells 2021-06-17   91  {
f343507aeda88b David Howells 2021-06-17   92  	struct netfs_dirty_region *t=
arget =3D *_target, *prev;
f343507aeda88b David Howells 2021-06-17   93  =

f343507aeda88b David Howells 2021-06-17   94  	target->from  =3D min(target=
->from, folio_pos(folio) + offset);
f343507aeda88b David Howells 2021-06-17   95  	target->to    =3D max(target=
->to,   folio_pos(folio) + offset + len);
f343507aeda88b David Howells 2021-06-17   96  	trace_netfs_dirty(ctx, targe=
t, NULL, *_first, *_last,
f343507aeda88b David Howells 2021-06-17   97  			  netfs_dirty_trace_modifi=
ed);
f343507aeda88b David Howells 2021-06-17   98  =

f343507aeda88b David Howells 2021-06-17   99  	/* We might have bridged to =
the previous region also. */
f343507aeda88b David Howells 2021-06-17  100  	prev =3D mas_prev(mas, *_fir=
st - 1);
f343507aeda88b David Howells 2021-06-17  101  	if (!netfs_mas_is_valid(prev=
))
f343507aeda88b David Howells 2021-06-17  102  		return false;
f343507aeda88b David Howells 2021-06-17  103  =

f343507aeda88b David Howells 2021-06-17  104  	if (prev->to !=3D target->fr=
om ||
f343507aeda88b David Howells 2021-06-17  105  	    prev->waiting_on_wb !=3D=
 target->waiting_on_wb)
f343507aeda88b David Howells 2021-06-17  106  		return false;
f343507aeda88b David Howells 2021-06-17  107  =

f343507aeda88b David Howells 2021-06-17  108  	*_first =3D mas->index;
f343507aeda88b David Howells 2021-06-17  109  	prev->to =3D target->to;
f343507aeda88b David Howells 2021-06-17  110  	*_to_put =3D target;
f343507aeda88b David Howells 2021-06-17  111  	trace_netfs_dirty(ctx, prev,=
 NULL, *_first, *_last,
f343507aeda88b David Howells 2021-06-17  112  			  netfs_dirty_trace_merged=
_prev);
f343507aeda88b David Howells 2021-06-17  113  	return true;
f343507aeda88b David Howells 2021-06-17  114  }
f343507aeda88b David Howells 2021-06-17  115  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7703965174989088951==--

