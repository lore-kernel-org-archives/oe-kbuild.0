Content-Type: multipart/mixed; boundary="===============4655741857270346284=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ntfs3/frecord.c:866:9: warning: use of NULL where non-null expected [CWE-476]
Date: Mon, 27 Jun 2022 03:04:29 +0000
Message-ID: <202206260624.bDBsVSYC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4655741857270346284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/ntfs3/=
frecord.c:866:9: warning: use of NULL where non-null expected [CWE-476] [-W=
analyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0840a7914caa14315a3191178a9f72c742477860
commit: 78ab59fee07f22464f32eafebab2bd97ba94ff2d fs/ntfs3: Rework file oper=
ations
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220624
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D78ab59fee07f22464f32eafebab2bd97ba94ff2d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 78ab59fee07f22464f32eafebab2bd97ba94ff2d
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
                     |      |            ^~~~~~~~~
                     |      |            |
                     |      |            (35) entry to 'ni_repack'
                     |......
                     |  527 |         struct ATTR_LIST_ENTRY *le =3D NULL, =
*le_p;
                     |      |                                 ~~
                     |      |                                 |
                     |      |                                 (36) 'le' is =
NULL
                     |......
                     |  536 |         while ((attr =3D ni_enum_attr_ex(ni, =
attr, &le, &mi))) {
                     |      |                        ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
                     |      |                        |
                     |      |                        (37) calling 'ni_enum_=
attr_ex' from 'ni_repack'
                     |
                     +--> 'ni_enum_attr_ex': events 38-39
                            |
                            |  249 | struct ATTRIB *ni_enum_attr_ex(struct =
ntfs_inode *ni, struct ATTRIB *attr,
                            |      |                ^~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (38) entry to 'ni_enum_=
attr_ex'
                            |......
                            |  257 |         if (!ni->attr_list.size) {
                            |      |            ~    =

                            |      |            |
                            |      |            (39) following 'true' branc=
h...
                            |
                          'ni_enum_attr_ex': events 40-42
                            |
                            |  258 |                 *le =3D NULL;
                            |  259 |                 if (mi)
                            |      |                    ~ =

                            |      |                    |
                            |      |                    (41) following 'tru=
e' branch (when 'mi' is non-NULL)...
                            |  260 |                         *mi =3D &ni->m=
i;
                            |      |                               ~~~~~~~
                            |      |                               |
                            |      |                               (42) ...=
to here
                            |
                     <------+
                     |
                   'ni_repack': events 43-46
                     |
                     |  536 |         while ((attr =3D ni_enum_attr_ex(ni, =
attr, &le, &mi))) {
                     |      |                ~       ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
                     |      |                |       |
                     |      |                |       (43) returning to 'ni_=
repack' from 'ni_enum_attr_ex'
                     |      |                (44) following 'true' branch (=
when 'attr' is non-NULL)...
                     |  537 |                 if (!attr->non_res)
                     |      |                    ~ ~~~~~~~~~~~~~
                     |      |                    |     |
                     |      |                    |     (45) ...to here
                     |      |                    (46) following 'false' bra=
nch...
                     |
                   'ni_repack': event 47
                     |
                     |  540 |                 svcn =3D le64_to_cpu(attr->nr=
es.svcn);
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition =
of macro '__le64_to_cpu'
                     |   32 | #define __le64_to_cpu(x) ((__force __u64)(__l=
e64)(x))
                     |      |                                              =
     ^
   fs/ntfs3/frecord.c:540:24: note: in expansion of macro 'le64_to_cpu'
                     |  540 |                 svcn =3D le64_to_cpu(attr->nr=
es.svcn);
                     |      |                        ^~~~~~~~~~~
                     |
                   'ni_repack': event 48
                     |
                     |  541 |                 if (svcn !=3D le64_to_cpu(le-=
>vcn)) {
                     |      |                                           ^~
                     |      |                                           |
                     |      |                                           (48=
) 'le' is NULL
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition =
of macro '__le64_to_cpu'
                     |   32 | #define __le64_to_cpu(x) ((__force __u64)(__l=
e64)(x))
                     |      |                                              =
     ^
   fs/ntfs3/frecord.c:541:29: note: in expansion of macro 'le64_to_cpu'
                     |  541 |                 if (svcn !=3D le64_to_cpu(le-=
>vcn)) {
                     |      |                             ^~~~~~~~~~~
                     |
                   'ni_repack': event 49
                     |
                     |  541 |                 if (svcn !=3D le64_to_cpu(le-=
>vcn)) {
                     |      |                                           ^~
                     |      |                                           |
                     |      |                                           (49=
) 'le' is NULL
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition =
of macro '__le64_to_cpu'
                     |   32 | #define __le64_to_cpu(x) ((__force __u64)(__l=
e64)(x))
                     |      |                                              =
     ^
   fs/ntfs3/frecord.c:541:29: note: in expansion of macro 'le64_to_cpu'
                     |  541 |                 if (svcn !=3D le64_to_cpu(le-=
>vcn)) {
                     |      |                             ^~~~~~~~~~~
                     |
                   'ni_repack': event 50
                     |
                     |  541 |                 if (svcn !=3D le64_to_cpu(le-=
>vcn)) {
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition =
of macro '__le64_to_cpu'
                     |   32 | #define __le64_to_cpu(x) ((__force __u64)(__l=
e64)(x))
                     |      |                                              =
     ^
   fs/ntfs3/frecord.c:541:29: note: in expansion of macro 'le64_to_cpu'
                     |  541 |                 if (svcn !=3D le64_to_cpu(le-=
>vcn)) {
                     |      |                             ^~~~~~~~~~~
                     |
   fs/ntfs3/frecord.c: In function 'ni_create_attr_list':
>> fs/ntfs3/frecord.c:866:9: warning: use of NULL where non-null expected [=
CWE-476] [-Wanalyzer-null-argument]
     866 |         memcpy(resident_data_ex(attr, lsize), ni->attr_list.le, =
lsize);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
     'ni_rename': events 1-2
       |
       | 2953 | int ni_rename(struct ntfs_inode *dir_ni, struct ntfs_inode =
*new_dir_ni,
       |      |     ^~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ni_rename'
       |......
       | 2975 |         err =3D ni_add_name(new_dir_ni, ni, new_de);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'ni_add_name' from 'ni_rename'
       |
       +--> 'ni_add_name': events 3-4
              |
              | 2921 | int ni_add_name(struct ntfs_inode *dir_ni, struct nt=
fs_inode *ni,
              |      |     ^~~~~~~~~~~
              |      |     |
              |      |     (3) entry to 'ni_add_name'
              |......
              | 2935 |         err =3D ni_insert_resident(ni, de_key_size, =
ATTR_NAME, NULL, 0, &attr,
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (4) calling 'ni_insert_resident' from =
'ni_add_name'
              | 2936 |                                  &mi, &le);
              |      |                                  ~~~~~~~~~
              |
              +--> 'ni_insert_resident': events 5-6
                     |
                     | 1431 | int ni_insert_resident(struct ntfs_inode *ni,=
 u32 data_size,
                     |      |     ^~~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (5) entry to 'ni_insert_resident'
                     |......
                     | 1441 |         err =3D ni_insert_attr(ni, type, name=
, name_len, asize, SIZEOF_RESIDENT,
                     |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (6) calling 'ni_insert_attr' fr=
om 'ni_insert_resident'
                     | 1442 |                              0, &attr, mi, le=
);
                     |      |                              ~~~~~~~~~~~~~~~~~
                     |
                     +--> 'ni_insert_attr': events 7-8
                            |
                            | 1021 | static int ni_insert_attr(struct ntfs_=
inode *ni, enum ATTR_TYPE type,
                            |      |            ^~~~~~~~~~~~~~
                            |      |            |
                            |      |            (7) entry to 'ni_insert_att=
r'
                            |......
                            | 1067 |                 err =3D ni_ins_attr_ex=
t(ni, NULL, type, name, name_len, asize,
                            |      |                       ~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                       |
                            |      |                       (8) calling 'ni_=
ins_attr_ext' from 'ni_insert_attr'
                            | 1068 |                                       =
svcn, name_off, false, ins_attr, ins_mi,
                            |      |                                       =
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            | 1069 |                                       =
ins_le);
                            |      |                                       =
~~~~~~~
                            |
                            +--> 'ni_ins_attr_ext': events 9-16
                                   |
                                   |  885 | static int ni_ins_attr_ext(stru=
ct ntfs_inode *ni, struct ATTR_LIST_ENTRY *le,
                                   |      |            ^~~~~~~~~~~~~~~
                                   |      |            |
                                   |      |            (9) entry to 'ni_ins=
_attr_ext'
                                   |......
                                   |  903 |         if (asize > sbi->max_by=
tes_per_attr) {
                                   |      |            ~
                                   |      |            |
                                   |      |            (10) following 'fals=
e' branch...
                                   |......
                                   |  912 |         if (type =3D=3D ATTR_ST=
D || type =3D=3D ATTR_LIST ||
                                   |      |            ~
                                   |      |            |
                                   |      |            (11) ...to here
                                   |      |            (12) following 'fals=
e' branch...
                                   |......
                                   |  919 |         if (!ni->attr_list.size=
) {
                                   |      |            ~ ~~~~~~~~~~~~~~~~~~
                                   |      |            |              |
                                   |      |            |              (13) =
...to here
                                   |      |            (14) following 'true=
' branch...
                                   |  920 |                 err =3D ni_crea=
te_attr_list(ni);
                                   |      |                       ~~~~~~~~~=
~~~~~~~~~~~~~~
                                   |      |                       |
                                   |      |                       (15) ...t=
o here
                                   |      |                       (16) call=
ing 'ni_create_attr_list' from 'ni_ins_attr_ext'
                                   |
                                   +--> 'ni_create_attr_list': events 17-18
                                          |
                                          |  744 | int ni_create_attr_list(=
struct ntfs_inode *ni)
                                          |      |     ^~~~~~~~~~~~~~~~~~~
                                          |      |     |
                                          |      |     (17) entry to 'ni_cr=
eate_attr_list'
                                          |......
                                          |  826 |         if (err)
                                          |      |            ~
                                          |      |            |
                                          |      |            (18) followin=
g 'false' branch (when 'err =3D=3D 0')...
                                          |
                                        'ni_create_attr_list': event 19

vim +866 fs/ntfs3/frecord.c

4342306f0f0d5f Konstantin Komarov 2021-08-13  740  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  741  /*
e8b8e97f91b80f Kari Argillander   2021-08-03  742   * ni_create_attr_list -=
 Generates an attribute list for this primary record.
4342306f0f0d5f Konstantin Komarov 2021-08-13  743  */
4342306f0f0d5f Konstantin Komarov 2021-08-13  744  int ni_create_attr_list(=
struct ntfs_inode *ni)
4342306f0f0d5f Konstantin Komarov 2021-08-13  745  {
4342306f0f0d5f Konstantin Komarov 2021-08-13  746  	struct ntfs_sb_info *sb=
i =3D ni->mi.sbi;
4342306f0f0d5f Konstantin Komarov 2021-08-13  747  	int err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  748  	u32 lsize;
4342306f0f0d5f Konstantin Komarov 2021-08-13  749  	struct ATTRIB *attr;
4342306f0f0d5f Konstantin Komarov 2021-08-13  750  	struct ATTRIB *arr_move=
[7];
4342306f0f0d5f Konstantin Komarov 2021-08-13  751  	struct ATTR_LIST_ENTRY =
*le, *le_b[7];
4342306f0f0d5f Konstantin Komarov 2021-08-13  752  	struct MFT_REC *rec;
4342306f0f0d5f Konstantin Komarov 2021-08-13  753  	bool is_mft;
4342306f0f0d5f Konstantin Komarov 2021-08-13  754  	CLST rno =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  755  	struct mft_inode *mi;
4342306f0f0d5f Konstantin Komarov 2021-08-13  756  	u32 free_b, nb, to_free=
, rs;
4342306f0f0d5f Konstantin Komarov 2021-08-13  757  	u16 sz;
4342306f0f0d5f Konstantin Komarov 2021-08-13  758  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  759  	is_mft =3D ni->mi.rno =
=3D=3D MFT_REC_MFT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  760  	rec =3D ni->mi.mrec;
4342306f0f0d5f Konstantin Komarov 2021-08-13  761  	rs =3D sbi->record_size;
4342306f0f0d5f Konstantin Komarov 2021-08-13  762  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  763  	/*
e8b8e97f91b80f Kari Argillander   2021-08-03  764  	 * Skip estimating exac=
t memory requirement.
e8b8e97f91b80f Kari Argillander   2021-08-03  765  	 * Looks like one recor=
d_size is always enough.
4342306f0f0d5f Konstantin Komarov 2021-08-13  766  	 */
195c52bdd5d5ec Kari Argillander   2021-08-24  767  	le =3D kmalloc(al_align=
ed(rs), GFP_NOFS);
4342306f0f0d5f Konstantin Komarov 2021-08-13  768  	if (!le) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  769  		err =3D -ENOMEM;
4342306f0f0d5f Konstantin Komarov 2021-08-13  770  		goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13  771  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  772  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  773  	mi_get_ref(&ni->mi, &le=
->ref);
4342306f0f0d5f Konstantin Komarov 2021-08-13  774  	ni->attr_list.le =3D le;
4342306f0f0d5f Konstantin Komarov 2021-08-13  775  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  776  	attr =3D NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  777  	nb =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  778  	free_b =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  779  	attr =3D NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  780  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  781  	for (; (attr =3D mi_enu=
m_attr(&ni->mi, attr)); le =3D Add2Ptr(le, sz)) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  782  		sz =3D le_size(attr->n=
ame_len);
4342306f0f0d5f Konstantin Komarov 2021-08-13  783  		le->type =3D attr->typ=
e;
4342306f0f0d5f Konstantin Komarov 2021-08-13  784  		le->size =3D cpu_to_le=
16(sz);
4342306f0f0d5f Konstantin Komarov 2021-08-13  785  		le->name_len =3D attr-=
>name_len;
4342306f0f0d5f Konstantin Komarov 2021-08-13  786  		le->name_off =3D offse=
tof(struct ATTR_LIST_ENTRY, name);
4342306f0f0d5f Konstantin Komarov 2021-08-13  787  		le->vcn =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  788  		if (le !=3D ni->attr_l=
ist.le)
4342306f0f0d5f Konstantin Komarov 2021-08-13  789  			le->ref =3D ni->attr_=
list.le->ref;
4342306f0f0d5f Konstantin Komarov 2021-08-13  790  		le->id =3D attr->id;
4342306f0f0d5f Konstantin Komarov 2021-08-13  791  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  792  		if (attr->name_len)
4342306f0f0d5f Konstantin Komarov 2021-08-13  793  			memcpy(le->name, attr=
_name(attr),
4342306f0f0d5f Konstantin Komarov 2021-08-13  794  			       sizeof(short) =
* attr->name_len);
4342306f0f0d5f Konstantin Komarov 2021-08-13  795  		else if (attr->type =
=3D=3D ATTR_STD)
4342306f0f0d5f Konstantin Komarov 2021-08-13  796  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  797  		else if (attr->type =
=3D=3D ATTR_LIST)
4342306f0f0d5f Konstantin Komarov 2021-08-13  798  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  799  		else if (is_mft && att=
r->type =3D=3D ATTR_DATA)
4342306f0f0d5f Konstantin Komarov 2021-08-13  800  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  801  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  802  		if (!nb || nb < ARRAY_=
SIZE(arr_move)) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  803  			le_b[nb] =3D le;
4342306f0f0d5f Konstantin Komarov 2021-08-13  804  			arr_move[nb++] =3D at=
tr;
4342306f0f0d5f Konstantin Komarov 2021-08-13  805  			free_b +=3D le32_to_c=
pu(attr->size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  806  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  807  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  808  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  809  	lsize =3D PtrOffset(ni-=
>attr_list.le, le);
4342306f0f0d5f Konstantin Komarov 2021-08-13  810  	ni->attr_list.size =3D =
lsize;
4342306f0f0d5f Konstantin Komarov 2021-08-13  811  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  812  	to_free =3D le32_to_cpu=
(rec->used) + lsize + SIZEOF_RESIDENT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  813  	if (to_free <=3D rs) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  814  		to_free =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  815  	} else {
4342306f0f0d5f Konstantin Komarov 2021-08-13  816  		to_free -=3D rs;
4342306f0f0d5f Konstantin Komarov 2021-08-13  817  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  818  		if (to_free > free_b) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  819  			err =3D -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  820  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  821  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  822  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  823  =

e8b8e97f91b80f Kari Argillander   2021-08-03  824  	/* Allocate child MFT. =
*/
4342306f0f0d5f Konstantin Komarov 2021-08-13  825  	err =3D ntfs_look_free_=
mft(sbi, &rno, is_mft, ni, &mi);
4342306f0f0d5f Konstantin Komarov 2021-08-13  826  	if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13  827  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  828  =

e8b8e97f91b80f Kari Argillander   2021-08-03  829  	/* Call mi_remove_attr(=
) in reverse order to keep pointers 'arr_move' valid. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  830  	while (to_free > 0) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  831  		struct ATTRIB *b =3D a=
rr_move[--nb];
4342306f0f0d5f Konstantin Komarov 2021-08-13  832  		u32 asize =3D le32_to_=
cpu(b->size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  833  		u16 name_off =3D le16_=
to_cpu(b->name_off);
4342306f0f0d5f Konstantin Komarov 2021-08-13  834  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  835  		attr =3D mi_insert_att=
r(mi, b->type, Add2Ptr(b, name_off),
4342306f0f0d5f Konstantin Komarov 2021-08-13  836  				      b->name_len, a=
size, name_off);
4342306f0f0d5f Konstantin Komarov 2021-08-13  837  		WARN_ON(!attr);
4342306f0f0d5f Konstantin Komarov 2021-08-13  838  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  839  		mi_get_ref(mi, &le_b[n=
b]->ref);
4342306f0f0d5f Konstantin Komarov 2021-08-13  840  		le_b[nb]->id =3D attr-=
>id;
4342306f0f0d5f Konstantin Komarov 2021-08-13  841  =

e8b8e97f91b80f Kari Argillander   2021-08-03  842  		/* Copy all except id.=
 */
4342306f0f0d5f Konstantin Komarov 2021-08-13  843  		memcpy(attr, b, asize);
4342306f0f0d5f Konstantin Komarov 2021-08-13  844  		attr->id =3D le_b[nb]-=
>id;
4342306f0f0d5f Konstantin Komarov 2021-08-13  845  =

78ab59fee07f22 Konstantin Komarov 2021-08-31  846  		/* Remove from primary=
 record. */
78ab59fee07f22 Konstantin Komarov 2021-08-31  847  		WARN_ON(!mi_remove_att=
r(NULL, &ni->mi, b));
4342306f0f0d5f Konstantin Komarov 2021-08-13  848  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  849  		if (to_free <=3D asize)
4342306f0f0d5f Konstantin Komarov 2021-08-13  850  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  851  		to_free -=3D asize;
4342306f0f0d5f Konstantin Komarov 2021-08-13  852  		WARN_ON(!nb);
4342306f0f0d5f Konstantin Komarov 2021-08-13  853  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  854  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  855  	attr =3D mi_insert_attr=
(&ni->mi, ATTR_LIST, NULL, 0,
4342306f0f0d5f Konstantin Komarov 2021-08-13  856  			      lsize + SIZEOF_=
RESIDENT, SIZEOF_RESIDENT);
4342306f0f0d5f Konstantin Komarov 2021-08-13  857  	WARN_ON(!attr);
4342306f0f0d5f Konstantin Komarov 2021-08-13  858  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  859  	attr->non_res =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  860  	attr->flags =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  861  	attr->res.data_size =3D=
 cpu_to_le32(lsize);
4342306f0f0d5f Konstantin Komarov 2021-08-13  862  	attr->res.data_off =3D =
SIZEOF_RESIDENT_LE;
4342306f0f0d5f Konstantin Komarov 2021-08-13  863  	attr->res.flags =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  864  	attr->res.res =3D 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  865  =

4342306f0f0d5f Konstantin Komarov 2021-08-13 @866  	memcpy(resident_data_ex=
(attr, lsize), ni->attr_list.le, lsize);
4342306f0f0d5f Konstantin Komarov 2021-08-13  867  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  868  	ni->attr_list.dirty =3D=
 false;
4342306f0f0d5f Konstantin Komarov 2021-08-13  869  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  870  	mark_inode_dirty(&ni->v=
fs_inode);
4342306f0f0d5f Konstantin Komarov 2021-08-13  871  	goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13  872  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  873  out1:
195c52bdd5d5ec Kari Argillander   2021-08-24  874  	kfree(ni->attr_list.le);
4342306f0f0d5f Konstantin Komarov 2021-08-13  875  	ni->attr_list.le =3D NU=
LL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  876  	ni->attr_list.size =3D =
0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  877  =

4342306f0f0d5f Konstantin Komarov 2021-08-13  878  out:
4342306f0f0d5f Konstantin Komarov 2021-08-13  879  	return err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  880  }
4342306f0f0d5f Konstantin Komarov 2021-08-13  881  =


:::::: The code at line 866 was first introduced by commit
:::::: 4342306f0f0d5ff4315a204d315c1b51b914fca5 fs/ntfs3: Add file operatio=
ns and implementation

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4655741857270346284==--

