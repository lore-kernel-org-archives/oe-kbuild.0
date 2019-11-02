Content-Type: multipart/mixed; boundary="===============6588233535425279496=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 7938/8210] fs/erofs/super.c:190 erofs_read_superblock() warn: passing the wrong variable to kunmap()
Date: Sat, 02 Nov 2019 12:33:11 +0300
Message-ID: <20191102093311.GC21796@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6588233535425279496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   49afce6d47fe05ee01f1a41129b835fe4cca7eea
commit: f0a6634246f9d8f73be2b22bdd475530914d22c7 [7938/8210] erofs: support=
 superblock checksum

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/erofs/super.c:190 erofs_read_superblock() warn: passing the wrong variab=
le to kunmap()

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Df0a6634246f9d8f73be2b22bdd475530914d22c7
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout f0a6634246f9d8f73be2b22bdd475530914d22c7
vim +190 fs/erofs/super.c

99634bf388db04 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
23  static int erofs_read_superblock(struct super_block *sb)
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
24  {
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
25  	struct erofs_sb_info *sbi;
fe7c2423570dca fs/erofs/super.c              Gao Xiang        2019-09-04  1=
26  	struct page *page;
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
27  	struct erofs_super_block *dsb;
7dd68b147d60e5 drivers/staging/erofs/super.c Thomas Wei=C3=9Fschuh 2018-09-=
10  128  	unsigned int blkszbits;
fe7c2423570dca fs/erofs/super.c              Gao Xiang        2019-09-04  1=
29  	void *data;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
30  	int ret;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
31  =

fe7c2423570dca fs/erofs/super.c              Gao Xiang        2019-09-04  1=
32  	page =3D read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
517d6b9c6f71be fs/erofs/super.c              Wei Yongjun      2019-09-18  1=
33  	if (IS_ERR(page)) {
4f761fa253b49f fs/erofs/super.c              Gao Xiang        2019-09-04  1=
34  		erofs_err(sb, "cannot read erofs superblock");
517d6b9c6f71be fs/erofs/super.c              Wei Yongjun      2019-09-18  1=
35  		return PTR_ERR(page);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
36  	}
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
37  =

ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
38  	sbi =3D EROFS_SB(sb);
fe7c2423570dca fs/erofs/super.c              Gao Xiang        2019-09-04  1=
39  =

f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
40  	data =3D kmap(page);
                                                                           =
     ^^^^^^^^^^^^^^^^^

fe7c2423570dca fs/erofs/super.c              Gao Xiang        2019-09-04  1=
41  	dsb =3D (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
42  =

ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
43  	ret =3D -EINVAL;
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
44  	if (le32_to_cpu(dsb->magic) !=3D EROFS_SUPER_MAGIC_V1) {
4f761fa253b49f fs/erofs/super.c              Gao Xiang        2019-09-04  1=
45  		erofs_err(sb, "cannot find valid erofs superblock");
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
46  		goto out;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
47  	}
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
48  =

f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
49  	sbi->feature_compat =3D le32_to_cpu(dsb->feature_compat);
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
50  	if (sbi->feature_compat & EROFS_FEATURE_COMPAT_SB_CHKSUM) {
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
51  		ret =3D erofs_superblock_csum_verify(sb, data);
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
52  		if (ret)
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
53  			goto out;
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
54  	}
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30  1=
55  =

0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
56  	blkszbits =3D dsb->blkszbits;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
57  	/* 9(512 bytes) + LOG_SECTORS_PER_BLOCK =3D=3D LOG_BLOCK_SIZE */
8d8a09b093d707 fs/erofs/super.c              Gao Xiang        2019-08-30  1=
58  	if (blkszbits !=3D LOG_BLOCK_SIZE) {
4f761fa253b49f fs/erofs/super.c              Gao Xiang        2019-09-04  1=
59  		erofs_err(sb, "blksize %u isn't supported on this platform",
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
60  			  1 << blkszbits);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
61  		goto out;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
62  	}
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
63  =

0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
64  	if (!check_layout_compatibility(sb, dsb))
5efe5137f05bbb drivers/staging/erofs/super.c Gao Xiang        2019-06-13  1=
65  		goto out;
5efe5137f05bbb drivers/staging/erofs/super.c Gao Xiang        2019-06-13  1=
66  =

0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
67  	sbi->blocks =3D le32_to_cpu(dsb->blocks);
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
68  	sbi->meta_blkaddr =3D le32_to_cpu(dsb->meta_blkaddr);
b17500a0fdbae1 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
69  #ifdef CONFIG_EROFS_FS_XATTR
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
70  	sbi->xattr_blkaddr =3D le32_to_cpu(dsb->xattr_blkaddr);
b17500a0fdbae1 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
71  #endif
8a76568225deae fs/erofs/super.c              Gao Xiang        2019-09-04  1=
72  	sbi->islotbits =3D ilog2(sizeof(struct erofs_inode_compact));
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
73  	sbi->root_nid =3D le16_to_cpu(dsb->root_nid);
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
74  	sbi->inos =3D le64_to_cpu(dsb->inos);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
75  =

0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
76  	sbi->build_time =3D le64_to_cpu(dsb->build_time);
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
77  	sbi->build_time_nsec =3D le32_to_cpu(dsb->build_time_nsec);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
78  =

0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
79  	memcpy(&sb->s_uuid, dsb->uuid, sizeof(dsb->uuid));
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
80  =

0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
81  	ret =3D strscpy(sbi->volume_name, dsb->volume_name,
0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-04  1=
82  		      sizeof(dsb->volume_name));
a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-18  1=
83  	if (ret < 0) {	/* -E2BIG */
4f761fa253b49f fs/erofs/super.c              Gao Xiang        2019-09-04  1=
84  		erofs_err(sb, "bad volume name without NIL terminator");
a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-18  1=
85  		ret =3D -EFSCORRUPTED;
a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-18  1=
86  		goto out;
a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-18  1=
87  	}
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
88  	ret =3D 0;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
89  out:
f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-30 @1=
90  	kunmap(data);
                                                                           =
     ^^^^^^^^^^^^
This should be kunmap(page);.  kmap() and kmap_atomic() are tricky like
that.

fe7c2423570dca fs/erofs/super.c              Gao Xiang        2019-09-04  1=
91  	put_page(page);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
92  	return ret;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
93  }
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-26  1=
94  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============6588233535425279496==--

