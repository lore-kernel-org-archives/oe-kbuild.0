Content-Type: multipart/mixed; boundary="===============7722814800443807796=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ntfs3/attrib.c:765:21: warning: use of NULL 'name' where non-null expected [CWE-476]
Date: Mon, 27 Jun 2022 03:04:30 +0000
Message-ID: <202206260347.KBcihh6t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7722814800443807796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/ntfs3/attrib.c:765:21: warning: use of NULL 'name' where non-null expec=
ted [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8c23f235a6a8ae43abea215812eb9d8cf4dd165e
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/=
Kconfig and fs/Makefile
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220625
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
                                   |      |                            |
                                   |      |                            (39)=
 ...to here
                                   |......
                                   |  197 |                 if (err =3D=3D =
-ENOSPC && pre) {
                                   |      |                    ~
                                   |      |                    |
                                   |      |                    (40) followi=
ng 'false' branch...
                                   |......
                                   |  204 |                 if (err)
                                   |      |                    ~
                                   |      |                    |
                                   |      |                    (41) ...to h=
ere
                                   |......
                                   |  207 |                 if (new_lcn && =
vcn =3D=3D vcn0)
                                   |      |                    ~
                                   |      |                    |
                                   |      |                    (42) followi=
ng 'false' branch...
                                   |......
                                   |  211 |                 if (!run_add_en=
try(run, vcn, lcn, flen, opt =3D=3D ALLOCATE_MFT)) {
                                   |      |                      ~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                      |
                                   |      |                      (43) ...to=
 here
                                   |
                            <------+
                            |
                          'attr_make_nonresident': events 44-55
                            |
                            |  291 |                 err =3D attr_allocate_=
clusters(sbi, run, 0, 0, len, NULL,
                            |      |                       ^~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                       |
                            |      |                       (44) returning t=
o 'attr_make_nonresident' from 'attr_allocate_clusters'
                            |  292 |                                       =
       ALLOCATE_DEF, &alen, 0, NULL);
                            |      |                                       =
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |  293 |                 if (err)
                            |      |                    ~   =

                            |      |                    |
                            |      |                    (45) following 'fal=
se' branch (when 'err =3D=3D 0')...
                            |......
                            |  296 |                 if (!rsize) {
                            |      |                    ~   =

                            |      |                    |
                            |      |                    (46) ...to here
                            |      |                    (47) following 'fal=
se' branch (when 'rsize !=3D 0')...
                            |  297 |                         /* empty resid=
ent -> non empty nonresident */
                            |  298 |                 } else if (!is_data) {
                            |      |                           ~
                            |      |                           |
                            |      |                           (48) ...to h=
ere
                            |      |                           (49) followi=
ng 'true' branch (when 'is_data !=3D 0')...
                            |......
                            |  302 |                 } else if (!page) {
                            |      |                           ~
                            |      |                           |
                            |      |                           (50) ...to h=
ere
                            |      |                           (51) followi=
ng 'true' branch (when 'page' is NULL)...
                            |......
                            |  305 |                         page =3D grab_=
cache_page(ni->vfs_inode.i_mapping, 0);
                            |      |                                ~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                                |
                            |      |                                (52) ..=
.to here
                            |  306 |                         if (!page) {
                            |      |                            ~
                            |      |                            |
                            |      |                            (53) follow=
ing 'false' branch...
                            |......
                            |  310 |                         kaddr =3D kmap=
_atomic(page);
                            |      |                                 ~~~~~~=
~~~~~~~~~~~
                            |      |                                 |
                            |      |                                 (54) .=
..to here
                            |      |                                 (55) c=
alling 'kmap_atomic' from 'attr_make_nonresident'
                            |
                            +--> 'kmap_atomic': event 56
                                   |
                                   |include/linux/highmem-internal.h:180:21:
                                   |  180 | static inline void *kmap_atomic=
(struct page *page)
                                   |      |                     ^~~~~~~~~~~
                                   |      |                     |
                                   |      |                     (56) entry =
to 'kmap_atomic'
                                   |
                                 'kmap_atomic': event 57
                                   |
                                   |include/linux/mmzone.h:1341:12:
                                   | 1341 |         if (!mem_section[SECTIO=
N_NR_TO_ROOT(nr)])
                                   |      |            ^
                                   |      |            |
                                   |      |            (57) following 'true=
' branch...
                                   |
                                 'kmap_atomic': event 58
                                   |
                                   |cc1:
                                   | (58): ...to here
                                   |
                                 'kmap_atomic': event 59
                                   |
                                   | 1372 |         unsigned long map =3D s=
ection->section_mem_map;
                                   |      |                       ^~~
                                   |      |                       |
                                   |      |                       (59) dere=
ference of NULL '<unknown>'
                                   |
   fs/ntfs3/attrib.c: In function 'attr_set_size':
>> fs/ntfs3/attrib.c:765:21: warning: use of NULL 'name' where non-null exp=
ected [CWE-476] [-Wanalyzer-null-argument]
     765 |                     memcmp(le_name(le), name, name_len * sizeof(=
short))) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
     'attr_collapse_range': events 1-6
       |
       | 1688 | int attr_collapse_range(struct ntfs_inode *ni, u64 vbo, u64=
 bytes)
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'attr_collapse_range'
       |......
       | 1702 |         if (!bytes)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'bytes !=3D 0=
')...
       |......
       | 1706 |         attr_b =3D ni_find_attr(ni, NULL, &le_b, ATTR_DATA,=
 NULL, 0, NULL, &mi_b);
       |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       | 1707 |         if (!attr_b)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'attr_b' is n=
on-NULL)...
       |......
       | 1710 |         if (!attr_b->non_res) {
       |      |            ~ ~~~~~~~~~~~~~~~
       |      |            |       |
       |      |            |       (5) ...to here
       |      |            (6) following 'false' branch...
       |
     'attr_collapse_range': events 7-12
       |
       | 1715 |         data_size =3D le64_to_cpu(attr_b->nres.data_size);
       |......
       | 1727 |         if ((vbo & mask) || (bytes & mask)) {
       |      |            ~       =

       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 1732 |         if (vbo > data_size)
       |      |            ~       =

       |      |            |
       |      |            (9) ...to here
       |      |            (10) following 'false' branch (when 'data_size >=
=3D vbo')...
       |......
       | 1735 |         down_write(&ni->file.run_lock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (11) ...to here
       | 1736 | =

       | 1737 |         if (vbo + bytes >=3D data_size) {
       |      |            ~       =

       |      |            |
       |      |            (12) following 'true' branch...
       |
     'attr_collapse_range': event 13
       |
       |include/linux/compiler-gcc.h:42:45:
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                                             ^~~~~~~~~~~~
       |      |                                             |
       |      |                                             (13) ...to here
   include/linux/minmax.h:31:27: note: in definition of macro '__cmp_once'
       |   31 |                 typeof(x) unique_x =3D (x);               \
       |      |                           ^~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
       |   60 | #define __PASTE(a,b) ___PASTE(a,b)
       |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                             ^~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
       |   60 | #define __PASTE(a,b) ___PASTE(a,b)
       |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                                     ^~~~~~~
   include/linux/minmax.h:38:34: note: in expansion of macro '__UNIQUE_ID'
       |   38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE=
_ID(__y), op))
       |      |                                  ^~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
       |   45 | #define min(x, y)       __careful_cmp(x, y, <)
       |      |                         ^~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1738:33: note: in expansion of macro 'min'
       | 1738 |                 u64 new_valid =3D min(ni->i_valid, vbo);
       |      |                                 ^~~
       |
     'attr_collapse_range': event 14
       |
       | 1742 |                 err =3D attr_set_size(ni, ATTR_DATA, NULL, =
0, &ni->file.run, vbo,
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (14) calling 'attr_set_size' from 'at=
tr_collapse_range'
       | 1743 |                                     &new_valid, true, NULL);
       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'attr_set_size': events 15-24
              |
              |  419 | int attr_set_size(struct ntfs_inode *ni, enum ATTR_T=
YPE type,
              |      |     ^~~~~~~~~~~~~
              |      |     |

vim +/name +765 fs/ntfs3/attrib.c

be71b5cba2e648 Konstantin Komarov 2021-08-13  408  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  409  /*
be71b5cba2e648 Konstantin Komarov 2021-08-13  410   * attr_set_size
be71b5cba2e648 Konstantin Komarov 2021-08-13  411   *
be71b5cba2e648 Konstantin Komarov 2021-08-13  412   * change the size of at=
tribute
be71b5cba2e648 Konstantin Komarov 2021-08-13  413   * Extend:
be71b5cba2e648 Konstantin Komarov 2021-08-13  414   *   - sparse/compressed=
: no allocated clusters
be71b5cba2e648 Konstantin Komarov 2021-08-13  415   *   - normal: append al=
located and preallocated new clusters
be71b5cba2e648 Konstantin Komarov 2021-08-13  416   * Shrink:
be71b5cba2e648 Konstantin Komarov 2021-08-13  417   *   - no deallocate if =
keep_prealloc is set
be71b5cba2e648 Konstantin Komarov 2021-08-13  418   */
be71b5cba2e648 Konstantin Komarov 2021-08-13  419  int attr_set_size(struct=
 ntfs_inode *ni, enum ATTR_TYPE type,
be71b5cba2e648 Konstantin Komarov 2021-08-13  420  		  const __le16 *name, =
u8 name_len, struct runs_tree *run,
be71b5cba2e648 Konstantin Komarov 2021-08-13  421  		  u64 new_size, const =
u64 *new_valid, bool keep_prealloc,
be71b5cba2e648 Konstantin Komarov 2021-08-13  422  		  struct ATTRIB **ret)
be71b5cba2e648 Konstantin Komarov 2021-08-13  423  {
be71b5cba2e648 Konstantin Komarov 2021-08-13  424  	int err =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  425  	struct ntfs_sb_info *sb=
i =3D ni->mi.sbi;
be71b5cba2e648 Konstantin Komarov 2021-08-13  426  	u8 cluster_bits =3D sbi=
->cluster_bits;
be71b5cba2e648 Konstantin Komarov 2021-08-13  427  	bool is_mft =3D
be71b5cba2e648 Konstantin Komarov 2021-08-13  428  		ni->mi.rno =3D=3D MFT_=
REC_MFT && type =3D=3D ATTR_DATA && !name_len;
be71b5cba2e648 Konstantin Komarov 2021-08-13  429  	u64 old_valid, old_size=
, old_alloc, new_alloc, new_alloc_tmp;
be71b5cba2e648 Konstantin Komarov 2021-08-13  430  	struct ATTRIB *attr =3D=
 NULL, *attr_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  431  	struct ATTR_LIST_ENTRY =
*le, *le_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  432  	struct mft_inode *mi, *=
mi_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  433  	CLST alen, vcn, lcn, ne=
w_alen, old_alen, svcn, evcn;
be71b5cba2e648 Konstantin Komarov 2021-08-13  434  	CLST next_svcn, pre_all=
oc =3D -1, done =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  435  	bool is_ext;
be71b5cba2e648 Konstantin Komarov 2021-08-13  436  	u32 align;
be71b5cba2e648 Konstantin Komarov 2021-08-13  437  	struct MFT_REC *rec;
be71b5cba2e648 Konstantin Komarov 2021-08-13  438  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  439  again:
be71b5cba2e648 Konstantin Komarov 2021-08-13  440  	le_b =3D NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  441  	attr_b =3D ni_find_attr=
(ni, NULL, &le_b, type, name, name_len, NULL,
be71b5cba2e648 Konstantin Komarov 2021-08-13  442  			      &mi_b);
be71b5cba2e648 Konstantin Komarov 2021-08-13  443  	if (!attr_b) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  444  		err =3D -ENOENT;
be71b5cba2e648 Konstantin Komarov 2021-08-13  445  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  446  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  447  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  448  	if (!attr_b->non_res) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  449  		err =3D attr_set_size_=
res(ni, attr_b, le_b, mi_b, new_size, run,
be71b5cba2e648 Konstantin Komarov 2021-08-13  450  					&attr_b);
be71b5cba2e648 Konstantin Komarov 2021-08-13  451  		if (err || !attr_b->no=
n_res)
be71b5cba2e648 Konstantin Komarov 2021-08-13  452  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  453  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  454  		/* layout of records m=
ay be changed, so do a full search */
be71b5cba2e648 Konstantin Komarov 2021-08-13  455  		goto again;
be71b5cba2e648 Konstantin Komarov 2021-08-13  456  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  457  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  458  	is_ext =3D is_attr_ext(=
attr_b);
be71b5cba2e648 Konstantin Komarov 2021-08-13  459  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  460  again_1:
be71b5cba2e648 Konstantin Komarov 2021-08-13  461  	align =3D sbi->cluster_=
size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  462  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  463  	if (is_ext) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  464  		align <<=3D attr_b->nr=
es.c_unit;
be71b5cba2e648 Konstantin Komarov 2021-08-13  465  		if (is_attr_sparsed(at=
tr_b))
be71b5cba2e648 Konstantin Komarov 2021-08-13  466  			keep_prealloc =3D fal=
se;
be71b5cba2e648 Konstantin Komarov 2021-08-13  467  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  468  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  469  	old_valid =3D le64_to_c=
pu(attr_b->nres.valid_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  470  	old_size =3D le64_to_cp=
u(attr_b->nres.data_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  471  	old_alloc =3D le64_to_c=
pu(attr_b->nres.alloc_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  472  	old_alen =3D old_alloc =
>> cluster_bits;
be71b5cba2e648 Konstantin Komarov 2021-08-13  473  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  474  	new_alloc =3D (new_size=
 + align - 1) & ~(u64)(align - 1);
be71b5cba2e648 Konstantin Komarov 2021-08-13  475  	new_alen =3D new_alloc =
>> cluster_bits;
be71b5cba2e648 Konstantin Komarov 2021-08-13  476  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  477  	if (keep_prealloc && is=
_ext)
be71b5cba2e648 Konstantin Komarov 2021-08-13  478  		keep_prealloc =3D fals=
e;
be71b5cba2e648 Konstantin Komarov 2021-08-13  479  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  480  	if (keep_prealloc && ne=
w_size < old_size) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  481  		attr_b->nres.data_size=
 =3D cpu_to_le64(new_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  482  		mi_b->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  483  		goto ok;
be71b5cba2e648 Konstantin Komarov 2021-08-13  484  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  485  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  486  	vcn =3D old_alen - 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  487  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  488  	svcn =3D le64_to_cpu(at=
tr_b->nres.svcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  489  	evcn =3D le64_to_cpu(at=
tr_b->nres.evcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  490  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  491  	if (svcn <=3D vcn && vc=
n <=3D evcn) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  492  		attr =3D attr_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  493  		le =3D le_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  494  		mi =3D mi_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  495  	} else if (!le_b) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  496  		err =3D -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  497  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  498  	} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  499  		le =3D le_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  500  		attr =3D ni_find_attr(=
ni, attr_b, &le, type, name, name_len, &vcn,
be71b5cba2e648 Konstantin Komarov 2021-08-13  501  				    &mi);
be71b5cba2e648 Konstantin Komarov 2021-08-13  502  		if (!attr) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  503  			err =3D -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  504  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  505  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  506  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  507  next_le_1:
be71b5cba2e648 Konstantin Komarov 2021-08-13  508  		svcn =3D le64_to_cpu(a=
ttr->nres.svcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  509  		evcn =3D le64_to_cpu(a=
ttr->nres.evcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  510  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  511  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  512  next_le:
be71b5cba2e648 Konstantin Komarov 2021-08-13  513  	rec =3D mi->mrec;
be71b5cba2e648 Konstantin Komarov 2021-08-13  514  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  515  	err =3D attr_load_runs(=
attr, ni, run, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13  516  	if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  517  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  518  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  519  	if (new_size > old_size=
) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  520  		CLST to_allocate;
be71b5cba2e648 Konstantin Komarov 2021-08-13  521  		size_t free;
be71b5cba2e648 Konstantin Komarov 2021-08-13  522  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  523  		if (new_alloc <=3D old=
_alloc) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  524  			attr_b->nres.data_siz=
e =3D cpu_to_le64(new_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  525  			mi_b->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  526  			goto ok;
be71b5cba2e648 Konstantin Komarov 2021-08-13  527  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  528  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  529  		to_allocate =3D new_al=
en - old_alen;
be71b5cba2e648 Konstantin Komarov 2021-08-13  530  add_alloc_in_same_attr_s=
eg:
be71b5cba2e648 Konstantin Komarov 2021-08-13  531  		lcn =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  532  		if (is_mft) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  533  			/* mft allocates clus=
ters from mftzone */
be71b5cba2e648 Konstantin Komarov 2021-08-13  534  			pre_alloc =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  535  		} else if (is_ext) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  536  			/* no preallocate for=
 sparse/compress */
be71b5cba2e648 Konstantin Komarov 2021-08-13  537  			pre_alloc =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  538  		} else if (pre_alloc =
=3D=3D -1) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  539  			pre_alloc =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  540  			if (type =3D=3D ATTR_=
DATA && !name_len &&
be71b5cba2e648 Konstantin Komarov 2021-08-13  541  			    sbi->options.prea=
lloc) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  542  				CLST new_alen2 =3D b=
ytes_to_cluster(
be71b5cba2e648 Konstantin Komarov 2021-08-13  543  					sbi, get_pre_alloca=
ted(new_size));
be71b5cba2e648 Konstantin Komarov 2021-08-13  544  				pre_alloc =3D new_al=
en2 - new_alen;
be71b5cba2e648 Konstantin Komarov 2021-08-13  545  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  546  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  547  			/* Get the last lcn t=
o allocate from */
be71b5cba2e648 Konstantin Komarov 2021-08-13  548  			if (old_alen &&
be71b5cba2e648 Konstantin Komarov 2021-08-13  549  			    !run_lookup_entry=
(run, vcn, &lcn, NULL, NULL)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  550  				lcn =3D SPARSE_LCN;
be71b5cba2e648 Konstantin Komarov 2021-08-13  551  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  552  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  553  			if (lcn =3D=3D SPARSE=
_LCN)
be71b5cba2e648 Konstantin Komarov 2021-08-13  554  				lcn =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  555  			else if (lcn)
be71b5cba2e648 Konstantin Komarov 2021-08-13  556  				lcn +=3D 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  557  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  558  			free =3D wnd_zeroes(&=
sbi->used.bitmap);
be71b5cba2e648 Konstantin Komarov 2021-08-13  559  			if (to_allocate > fre=
e) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  560  				err =3D -ENOSPC;
be71b5cba2e648 Konstantin Komarov 2021-08-13  561  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  562  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  563  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  564  			if (pre_alloc && to_a=
llocate + pre_alloc > free)
be71b5cba2e648 Konstantin Komarov 2021-08-13  565  				pre_alloc =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  566  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  567  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  568  		vcn =3D old_alen;
be71b5cba2e648 Konstantin Komarov 2021-08-13  569  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  570  		if (is_ext) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  571  			if (!run_add_entry(ru=
n, vcn, SPARSE_LCN, to_allocate,
be71b5cba2e648 Konstantin Komarov 2021-08-13  572  					   false)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  573  				err =3D -ENOMEM;
be71b5cba2e648 Konstantin Komarov 2021-08-13  574  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  575  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  576  			alen =3D to_allocate;
be71b5cba2e648 Konstantin Komarov 2021-08-13  577  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  578  			/* ~3 bytes per fragm=
ent */
be71b5cba2e648 Konstantin Komarov 2021-08-13  579  			err =3D attr_allocate=
_clusters(
be71b5cba2e648 Konstantin Komarov 2021-08-13  580  				sbi, run, vcn, lcn, =
to_allocate, &pre_alloc,
be71b5cba2e648 Konstantin Komarov 2021-08-13  581  				is_mft ? ALLOCATE_MF=
T : 0, &alen,
be71b5cba2e648 Konstantin Komarov 2021-08-13  582  				is_mft ? 0
be71b5cba2e648 Konstantin Komarov 2021-08-13  583  				       : (sbi->recor=
d_size -
be71b5cba2e648 Konstantin Komarov 2021-08-13  584  					  le32_to_cpu(rec->=
used) + 8) /
be71b5cba2e648 Konstantin Komarov 2021-08-13  585  							 3 +
be71b5cba2e648 Konstantin Komarov 2021-08-13  586  						 1,
be71b5cba2e648 Konstantin Komarov 2021-08-13  587  				NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13  588  			if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  589  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  590  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  591  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  592  		done +=3D alen;
be71b5cba2e648 Konstantin Komarov 2021-08-13  593  		vcn +=3D alen;
be71b5cba2e648 Konstantin Komarov 2021-08-13  594  		if (to_allocate > alen)
be71b5cba2e648 Konstantin Komarov 2021-08-13  595  			to_allocate -=3D alen;
be71b5cba2e648 Konstantin Komarov 2021-08-13  596  		else
be71b5cba2e648 Konstantin Komarov 2021-08-13  597  			to_allocate =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  598  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  599  pack_runs:
be71b5cba2e648 Konstantin Komarov 2021-08-13  600  		err =3D mi_pack_runs(m=
i, attr, run, vcn - svcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  601  		if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  602  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  603  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  604  		next_svcn =3D le64_to_=
cpu(attr->nres.evcn) + 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  605  		new_alloc_tmp =3D (u64=
)next_svcn << cluster_bits;
be71b5cba2e648 Konstantin Komarov 2021-08-13  606  		attr_b->nres.alloc_siz=
e =3D cpu_to_le64(new_alloc_tmp);
be71b5cba2e648 Konstantin Komarov 2021-08-13  607  		mi_b->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  608  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  609  		if (next_svcn >=3D vcn=
 && !to_allocate) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  610  			/* Normal way. update=
 attribute and exit */
be71b5cba2e648 Konstantin Komarov 2021-08-13  611  			attr_b->nres.data_siz=
e =3D cpu_to_le64(new_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  612  			goto ok;
be71b5cba2e648 Konstantin Komarov 2021-08-13  613  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  614  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  615  		/* at least two mft to=
 avoid recursive loop*/
be71b5cba2e648 Konstantin Komarov 2021-08-13  616  		if (is_mft && next_svc=
n =3D=3D vcn &&
be71b5cba2e648 Konstantin Komarov 2021-08-13  617  		    ((u64)done << sbi-=
>cluster_bits) >=3D 2 * sbi->record_size) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  618  			new_size =3D new_allo=
c_tmp;
be71b5cba2e648 Konstantin Komarov 2021-08-13  619  			attr_b->nres.data_siz=
e =3D attr_b->nres.alloc_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  620  			goto ok;
be71b5cba2e648 Konstantin Komarov 2021-08-13  621  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  622  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  623  		if (le32_to_cpu(rec->u=
sed) < sbi->record_size) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  624  			old_alen =3D next_svc=
n;
be71b5cba2e648 Konstantin Komarov 2021-08-13  625  			evcn =3D old_alen - 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  626  			goto add_alloc_in_sam=
e_attr_seg;
be71b5cba2e648 Konstantin Komarov 2021-08-13  627  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  628  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  629  		attr_b->nres.data_size=
 =3D attr_b->nres.alloc_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  630  		if (new_alloc_tmp < ol=
d_valid)
be71b5cba2e648 Konstantin Komarov 2021-08-13  631  			attr_b->nres.valid_si=
ze =3D attr_b->nres.data_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  632  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  633  		if (type =3D=3D ATTR_L=
IST) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  634  			err =3D ni_expand_lis=
t(ni);
be71b5cba2e648 Konstantin Komarov 2021-08-13  635  			if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  636  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  637  			if (next_svcn < vcn)
be71b5cba2e648 Konstantin Komarov 2021-08-13  638  				goto pack_runs;
be71b5cba2e648 Konstantin Komarov 2021-08-13  639  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  640  			/* layout of records =
is changed */
be71b5cba2e648 Konstantin Komarov 2021-08-13  641  			goto again;
be71b5cba2e648 Konstantin Komarov 2021-08-13  642  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  643  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  644  		if (!ni->attr_list.siz=
e) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  645  			err =3D ni_create_att=
r_list(ni);
be71b5cba2e648 Konstantin Komarov 2021-08-13  646  			if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  647  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  648  			/* layout of records =
is changed */
be71b5cba2e648 Konstantin Komarov 2021-08-13  649  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  650  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  651  		if (next_svcn >=3D vcn=
) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  652  			/* this is mft data, =
repeat */
be71b5cba2e648 Konstantin Komarov 2021-08-13  653  			goto again;
be71b5cba2e648 Konstantin Komarov 2021-08-13  654  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  655  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  656  		/* insert new attribut=
e segment */
be71b5cba2e648 Konstantin Komarov 2021-08-13  657  		err =3D ni_insert_nonr=
esident(ni, type, name, name_len, run,
be71b5cba2e648 Konstantin Komarov 2021-08-13  658  					    next_svcn, vcn =
- next_svcn,
be71b5cba2e648 Konstantin Komarov 2021-08-13  659  					    attr_b->flags, =
&attr, &mi);
be71b5cba2e648 Konstantin Komarov 2021-08-13  660  		if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  661  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  662  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  663  		if (!is_mft)
be71b5cba2e648 Konstantin Komarov 2021-08-13  664  			run_truncate_head(run=
, evcn + 1);
be71b5cba2e648 Konstantin Komarov 2021-08-13  665  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  666  		svcn =3D le64_to_cpu(a=
ttr->nres.svcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  667  		evcn =3D le64_to_cpu(a=
ttr->nres.evcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  668  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  669  		le_b =3D NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  670  		/* layout of records m=
aybe changed */
be71b5cba2e648 Konstantin Komarov 2021-08-13  671  		/* find base attribute=
 to update*/
be71b5cba2e648 Konstantin Komarov 2021-08-13  672  		attr_b =3D ni_find_att=
r(ni, NULL, &le_b, type, name, name_len,
be71b5cba2e648 Konstantin Komarov 2021-08-13  673  				      NULL, &mi_b);
be71b5cba2e648 Konstantin Komarov 2021-08-13  674  		if (!attr_b) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  675  			err =3D -ENOENT;
be71b5cba2e648 Konstantin Komarov 2021-08-13  676  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  677  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  678  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  679  		attr_b->nres.alloc_siz=
e =3D cpu_to_le64((u64)vcn << cluster_bits);
be71b5cba2e648 Konstantin Komarov 2021-08-13  680  		attr_b->nres.data_size=
 =3D attr_b->nres.alloc_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  681  		attr_b->nres.valid_siz=
e =3D attr_b->nres.alloc_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  682  		mi_b->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  683  		goto again_1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  684  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  685  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  686  	if (new_size !=3D old_s=
ize ||
be71b5cba2e648 Konstantin Komarov 2021-08-13  687  	    (new_alloc !=3D old=
_alloc && !keep_prealloc)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  688  		vcn =3D max(svcn, new_=
alen);
be71b5cba2e648 Konstantin Komarov 2021-08-13  689  		new_alloc_tmp =3D (u64=
)vcn << cluster_bits;
be71b5cba2e648 Konstantin Komarov 2021-08-13  690  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  691  		alen =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  692  		err =3D run_deallocate=
_ex(sbi, run, vcn, evcn - vcn + 1, &alen,
be71b5cba2e648 Konstantin Komarov 2021-08-13  693  					true);
be71b5cba2e648 Konstantin Komarov 2021-08-13  694  		if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  695  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  696  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  697  		run_truncate(run, vcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  698  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  699  		if (vcn > svcn) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  700  			err =3D mi_pack_runs(=
mi, attr, run, vcn - svcn);
be71b5cba2e648 Konstantin Komarov 2021-08-13  701  			if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  702  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  703  		} else if (le && le->v=
cn) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  704  			u16 le_sz =3D le16_to=
_cpu(le->size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  705  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  706  			/*
be71b5cba2e648 Konstantin Komarov 2021-08-13  707  			 * NOTE: list entries=
 for one attribute are always
be71b5cba2e648 Konstantin Komarov 2021-08-13  708  			 * the same size. We =
deal with last entry (vcn=3D=3D0)
be71b5cba2e648 Konstantin Komarov 2021-08-13  709  			 * and it is not firs=
t in entries array
be71b5cba2e648 Konstantin Komarov 2021-08-13  710  			 * (list entry for st=
d attribute always first)
be71b5cba2e648 Konstantin Komarov 2021-08-13  711  			 * So it is safe to s=
tep back
be71b5cba2e648 Konstantin Komarov 2021-08-13  712  			 */
be71b5cba2e648 Konstantin Komarov 2021-08-13  713  			mi_remove_attr(mi, at=
tr);
be71b5cba2e648 Konstantin Komarov 2021-08-13  714  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  715  			if (!al_remove_le(ni,=
 le)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  716  				err =3D -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  717  				goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  718  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  719  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  720  			le =3D (struct ATTR_L=
IST_ENTRY *)((u8 *)le - le_sz);
be71b5cba2e648 Konstantin Komarov 2021-08-13  721  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  722  			attr->nres.evcn =3D c=
pu_to_le64((u64)vcn - 1);
be71b5cba2e648 Konstantin Komarov 2021-08-13  723  			mi->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  724  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  725  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  726  		attr_b->nres.alloc_siz=
e =3D cpu_to_le64(new_alloc_tmp);
be71b5cba2e648 Konstantin Komarov 2021-08-13  727  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  728  		if (vcn =3D=3D new_ale=
n) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  729  			attr_b->nres.data_siz=
e =3D cpu_to_le64(new_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  730  			if (new_size < old_va=
lid)
be71b5cba2e648 Konstantin Komarov 2021-08-13  731  				attr_b->nres.valid_s=
ize =3D
be71b5cba2e648 Konstantin Komarov 2021-08-13  732  					attr_b->nres.data_s=
ize;
be71b5cba2e648 Konstantin Komarov 2021-08-13  733  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  734  			if (new_alloc_tmp <=
=3D
be71b5cba2e648 Konstantin Komarov 2021-08-13  735  			    le64_to_cpu(attr_=
b->nres.data_size))
be71b5cba2e648 Konstantin Komarov 2021-08-13  736  				attr_b->nres.data_si=
ze =3D
be71b5cba2e648 Konstantin Komarov 2021-08-13  737  					attr_b->nres.alloc_=
size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  738  			if (new_alloc_tmp <
be71b5cba2e648 Konstantin Komarov 2021-08-13  739  			    le64_to_cpu(attr_=
b->nres.valid_size))
be71b5cba2e648 Konstantin Komarov 2021-08-13  740  				attr_b->nres.valid_s=
ize =3D
be71b5cba2e648 Konstantin Komarov 2021-08-13  741  					attr_b->nres.alloc_=
size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  742  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  743  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  744  		if (is_ext)
be71b5cba2e648 Konstantin Komarov 2021-08-13  745  			le64_sub_cpu(&attr_b-=
>nres.total_size,
be71b5cba2e648 Konstantin Komarov 2021-08-13  746  				     ((u64)alen << c=
luster_bits));
be71b5cba2e648 Konstantin Komarov 2021-08-13  747  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  748  		mi_b->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  749  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  750  		if (new_alloc_tmp <=3D=
 new_alloc)
be71b5cba2e648 Konstantin Komarov 2021-08-13  751  			goto ok;
be71b5cba2e648 Konstantin Komarov 2021-08-13  752  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  753  		old_size =3D new_alloc=
_tmp;
be71b5cba2e648 Konstantin Komarov 2021-08-13  754  		vcn =3D svcn - 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  755  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  756  		if (le =3D=3D le_b) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  757  			attr =3D attr_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  758  			mi =3D mi_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  759  			evcn =3D svcn - 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  760  			svcn =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  761  			goto next_le;
be71b5cba2e648 Konstantin Komarov 2021-08-13  762  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  763  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  764  		if (le->type !=3D type=
 || le->name_len !=3D name_len ||
be71b5cba2e648 Konstantin Komarov 2021-08-13 @765  		    memcmp(le_name(le)=
, name, name_len * sizeof(short))) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  766  			err =3D -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  767  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  768  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  769  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  770  		err =3D ni_load_mi(ni,=
 le, &mi);
be71b5cba2e648 Konstantin Komarov 2021-08-13  771  		if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  772  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  773  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  774  		attr =3D mi_find_attr(=
mi, NULL, type, name, name_len, &le->id);
be71b5cba2e648 Konstantin Komarov 2021-08-13  775  		if (!attr) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  776  			err =3D -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  777  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  778  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  779  		goto next_le_1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  780  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  781  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  782  ok:
be71b5cba2e648 Konstantin Komarov 2021-08-13  783  	if (new_valid) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  784  		__le64 valid =3D cpu_t=
o_le64(min(*new_valid, new_size));
be71b5cba2e648 Konstantin Komarov 2021-08-13  785  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  786  		if (attr_b->nres.valid=
_size !=3D valid) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  787  			attr_b->nres.valid_si=
ze =3D valid;
be71b5cba2e648 Konstantin Komarov 2021-08-13  788  			mi_b->dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  789  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  790  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  791  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  792  out:
be71b5cba2e648 Konstantin Komarov 2021-08-13  793  	if (!err && attr_b && r=
et)
be71b5cba2e648 Konstantin Komarov 2021-08-13  794  		*ret =3D attr_b;
be71b5cba2e648 Konstantin Komarov 2021-08-13  795  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  796  	/* update inode_set_byt=
es*/
be71b5cba2e648 Konstantin Komarov 2021-08-13  797  	if (!err && ((type =3D=
=3D ATTR_DATA && !name_len) ||
be71b5cba2e648 Konstantin Komarov 2021-08-13  798  		     (type =3D=3D ATTR=
_ALLOC && name =3D=3D I30_NAME))) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  799  		bool dirty =3D false;
be71b5cba2e648 Konstantin Komarov 2021-08-13  800  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  801  		if (ni->vfs_inode.i_si=
ze !=3D new_size) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  802  			ni->vfs_inode.i_size =
=3D new_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  803  			dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  804  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  805  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  806  		if (attr_b && attr_b->=
non_res) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  807  			new_alloc =3D le64_to=
_cpu(attr_b->nres.alloc_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  808  			if (inode_get_bytes(&=
ni->vfs_inode) !=3D new_alloc) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  809  				inode_set_bytes(&ni-=
>vfs_inode, new_alloc);
be71b5cba2e648 Konstantin Komarov 2021-08-13  810  				dirty =3D true;
be71b5cba2e648 Konstantin Komarov 2021-08-13  811  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  812  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  813  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  814  		if (dirty) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  815  			ni->ni_flags |=3D NI_=
FLAG_UPDATE_PARENT;
be71b5cba2e648 Konstantin Komarov 2021-08-13  816  			mark_inode_dirty(&ni-=
>vfs_inode);
be71b5cba2e648 Konstantin Komarov 2021-08-13  817  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  818  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  819  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  820  	return err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  821  }
be71b5cba2e648 Konstantin Komarov 2021-08-13  822  =


:::::: The code at line 765 was first introduced by commit
:::::: be71b5cba2e6485e8959da7a9f9a44461a1bb074 fs/ntfs3: Add attrib operat=
ions

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7722814800443807796==--

