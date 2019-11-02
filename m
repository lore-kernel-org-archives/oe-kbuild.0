Content-Type: multipart/mixed; boundary="===============2600914336971935195=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [chao-linux:compression 1/3] fs/f2fs/data.c:433 __has_merged_page() error: 'target' dereferencing possible ERR_PTR()
Date: Sat, 02 Nov 2019 11:53:09 +0300
Message-ID: <20191102085309.GB21796@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2600914336971935195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git comp=
ression
head:   1c310bddebde4e94a780c2b2699a3ac35e166ca9
commit: b49443e5f3aecab358837790dfb5a30fd95a7926 [1/3] f2fs: support data c=
ompression

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/f2fs/data.c:433 __has_merged_page() error: 'target' dereferencing possib=
le ERR_PTR()

Old smatch warnings:
fs/f2fs/data.c:2451 f2fs_write_single_data_page() warn: should '(page->inde=
x + 1) << 12' be a 64 bit type?

# https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?id=
=3Db49443e5f3aecab358837790dfb5a30fd95a7926
git remote add chao-linux https://git.kernel.org/pub/scm/linux/kernel/git/c=
hao/linux.git
git remote update chao-linux
git checkout b49443e5f3aecab358837790dfb5a30fd95a7926
vim +/target +433 fs/f2fs/data.c

8648de2c581eed Chao Yu      2019-02-19  413  static bool __has_merged_page(=
struct bio *bio, struct inode *inode,
bab475c5414e8d Chao Yu      2018-09-27  414  						struct page *page, nid_t=
 ino)
0fd785eb931d25 Chao Yu      2016-01-18  415  {
0fd785eb931d25 Chao Yu      2016-01-18  416  	struct bio_vec *bvec;
6dc4f100c175dd Ming Lei     2019-02-15  417  	struct bvec_iter_all iter_all;
0fd785eb931d25 Chao Yu      2016-01-18  418  =

8648de2c581eed Chao Yu      2019-02-19  419  	if (!bio)
0fd785eb931d25 Chao Yu      2016-01-18  420  		return false;
0c3a579758362d Chao Yu      2016-01-18  421  =

bab475c5414e8d Chao Yu      2018-09-27  422  	if (!inode && !page && !ino)
0c3a579758362d Chao Yu      2016-01-18  423  		return true;
0fd785eb931d25 Chao Yu      2016-01-18  424  =

8648de2c581eed Chao Yu      2019-02-19  425  	bio_for_each_segment_all(bvec=
, bio, iter_all) {
b49443e5f3aeca Chao Yu      2019-10-29  426  		struct page *target =3D bvec=
->bv_page;
0fd785eb931d25 Chao Yu      2016-01-18  427  =

d2d0727b1654e1 Eric Biggers 2019-05-20  428  		if (fscrypt_is_bounce_page(t=
arget))
d2d0727b1654e1 Eric Biggers 2019-05-20  429  			target =3D fscrypt_pagecach=
e_page(target);
b49443e5f3aeca Chao Yu      2019-10-29  430  		if (f2fs_is_compressed_page(=
target))
b49443e5f3aeca Chao Yu      2019-10-29  431  			target =3D f2fs_compress_co=
ntrol_page(target);
0fd785eb931d25 Chao Yu      2016-01-18  432  =

0c3a579758362d Chao Yu      2016-01-18 @433  		if (inode && inode =3D=3D ta=
rget->mapping->host)
0c3a579758362d Chao Yu      2016-01-18  434  			return true;
bab475c5414e8d Chao Yu      2018-09-27  435  		if (page && page =3D=3D targ=
et)
bab475c5414e8d Chao Yu      2018-09-27  436  			return true;
0c3a579758362d Chao Yu      2016-01-18  437  		if (ino && ino =3D=3D ino_of=
_node(target))
0fd785eb931d25 Chao Yu      2016-01-18  438  			return true;
0fd785eb931d25 Chao Yu      2016-01-18  439  	}
0c3a579758362d Chao Yu      2016-01-18  440  =

0c3a579758362d Chao Yu      2016-01-18  441  	return false;
0fd785eb931d25 Chao Yu      2016-01-18  442  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============2600914336971935195==--

