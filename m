Content-Type: multipart/mixed; boundary="===============2446923547109319623=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/super.c:4826 __ext4_fill_super() warn: bitwise AND condition is false here
Date: Tue, 18 Jan 2022 20:45:48 +0800
Message-ID: <202201182025.yzdTzSIo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2446923547109319623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lukas Czerner <lczerner@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe81ba137ebcc7f236780996a0b375732c07e85c
commit: 7edfd85b1ffd36593011dec96ab395912a340418 ext4: Completely separate =
options parsing and sb setup
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m031-20220117 (https://download.01.org/0day-ci/arch=
ive/20220118/202201182025.yzdTzSIo-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/super.c:4826 __ext4_fill_super() warn: bitwise AND condition is fal=
se here

Old smatch warnings:
fs/ext4/super.c:2918 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:2926 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:2929 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:4124 ext4_register_li_request() error: we previously assume=
d 'ext4_li_info' could be null (see line 4106)

vim +4826 fs/ext4/super.c

c83ad55eaa91c8 Gabriel Krisman Bertazi    2019-04-25  4716  =

56889787cfa77d Theodore Ts'o              2011-09-03  4717  	if (test_opt(s=
b, DATA_FLAGS) =3D=3D EXT4_MOUNT_JOURNAL_DATA) {
556e0319fbb8ee Harshad Shirwadkar         2020-11-05  4718  		printk_once(K=
ERN_WARNING "EXT4-fs: Warning: mounting with data=3Djournal disables delaye=
d allocation, dioread_nolock, O_DIRECT and fast_commit support!\n");
781c036b678c9a Kaixu Xia                  2020-04-13  4719  		/* can't moun=
t with both data=3Djournal and dioread_nolock. */
244adf6426ee31 Theodore Ts'o              2020-01-23  4720  		clear_opt(sb,=
 DIOREAD_NOLOCK);
556e0319fbb8ee Harshad Shirwadkar         2020-11-05  4721  		clear_opt2(sb=
, JOURNAL_FAST_COMMIT);
56889787cfa77d Theodore Ts'o              2011-09-03  4722  		if (test_opt2=
(sb, EXPLICIT_DELALLOC)) {
56889787cfa77d Theodore Ts'o              2011-09-03  4723  			ext4_msg(sb,=
 KERN_ERR, "can't mount with "
56889787cfa77d Theodore Ts'o              2011-09-03  4724  				 "both data=
=3Djournal and delalloc");
56889787cfa77d Theodore Ts'o              2011-09-03  4725  			goto failed_=
mount;
56889787cfa77d Theodore Ts'o              2011-09-03  4726  		}
fc626fe322f13e Ira Weiny                  2020-05-28  4727  		if (test_opt(=
sb, DAX_ALWAYS)) {
923ae0ff925043 Ross Zwisler               2015-02-16  4728  			ext4_msg(sb,=
 KERN_ERR, "can't mount with "
923ae0ff925043 Ross Zwisler               2015-02-16  4729  				 "both data=
=3Djournal and dax");
923ae0ff925043 Ross Zwisler               2015-02-16  4730  			goto failed_=
mount;
923ae0ff925043 Ross Zwisler               2015-02-16  4731  		}
73b92a2a5e97d1 Sergey Karamov             2016-12-10  4732  		if (ext4_has_=
feature_encrypt(sb)) {
73b92a2a5e97d1 Sergey Karamov             2016-12-10  4733  			ext4_msg(sb,=
 KERN_WARNING,
73b92a2a5e97d1 Sergey Karamov             2016-12-10  4734  				 "encrypted=
 files will use data=3Dordered "
73b92a2a5e97d1 Sergey Karamov             2016-12-10  4735  				 "instead o=
f data journaling mode");
73b92a2a5e97d1 Sergey Karamov             2016-12-10  4736  		}
56889787cfa77d Theodore Ts'o              2011-09-03  4737  		if (test_opt(=
sb, DELALLOC))
56889787cfa77d Theodore Ts'o              2011-09-03  4738  			clear_opt(sb=
, DELALLOC);
001e4a8775f6e8 Tejun Heo                  2015-07-21  4739  	} else {
001e4a8775f6e8 Tejun Heo                  2015-07-21  4740  		sb->s_iflags =
|=3D SB_I_CGROUPWB;
56889787cfa77d Theodore Ts'o              2011-09-03  4741  	}
56889787cfa77d Theodore Ts'o              2011-09-03  4742  =

1751e8a6cb935e Linus Torvalds             2017-11-27  4743  	sb->s_flags =
=3D (sb->s_flags & ~SB_POSIXACL) |
1751e8a6cb935e Linus Torvalds             2017-11-27  4744  		(test_opt(sb,=
 POSIX_ACL) ? SB_POSIXACL : 0);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4745  =

617ba13b31fbf5 Mingming Cao               2006-10-11  4746  	if (le32_to_cp=
u(es->s_rev_level) =3D=3D EXT4_GOOD_OLD_REV &&
e2b911c53584a9 Darrick J. Wong            2015-10-17  4747  	    (ext4_has_=
compat_features(sb) ||
e2b911c53584a9 Darrick J. Wong            2015-10-17  4748  	     ext4_has_=
ro_compat_features(sb) ||
e2b911c53584a9 Darrick J. Wong            2015-10-17  4749  	     ext4_has_=
incompat_features(sb)))
b31e15527a9bb7 Eric Sandeen               2009-06-04  4750  		ext4_msg(sb, =
KERN_WARNING,
b31e15527a9bb7 Eric Sandeen               2009-06-04  4751  		       "featu=
re flags set on rev 0 fs, "
b31e15527a9bb7 Eric Sandeen               2009-06-04  4752  		       "runni=
ng e2fsck is recommended");
469108ff3dcbc0 Theodore Tso               2008-02-10  4753  =

ed3654eb981fd4 Theodore Ts'o              2014-03-24  4754  	if (es->s_crea=
tor_os =3D=3D cpu_to_le32(EXT4_OS_HURD)) {
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4755  		set_opt2(sb, =
HURD_COMPAT);
e2b911c53584a9 Darrick J. Wong            2015-10-17  4756  		if (ext4_has_=
feature_64bit(sb)) {
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4757  			ext4_msg(sb,=
 KERN_ERR,
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4758  				 "The Hurd =
can't support 64-bit file systems");
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4759  			goto failed_=
mount;
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4760  		}
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4761  =

dec214d00e0d78 Tahsin Erdogan             2017-06-22  4762  		/*
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4763  		 * ea_inode f=
eature uses l_i_version field which is not
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4764  		 * available =
in HURD_COMPAT mode.
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4765  		 */
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4766  		if (ext4_has_=
feature_ea_inode(sb)) {
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4767  			ext4_msg(sb,=
 KERN_ERR,
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4768  				 "ea_inode =
feature is not supported for Hurd");
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4769  			goto failed_=
mount;
dec214d00e0d78 Tahsin Erdogan             2017-06-22  4770  		}
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4771  	}
ed3654eb981fd4 Theodore Ts'o              2014-03-24  4772  =

2035e776050aea Theodore Ts'o              2011-04-18  4773  	if (IS_EXT2_SB=
(sb)) {
2035e776050aea Theodore Ts'o              2011-04-18  4774  		if (ext2_feat=
ure_set_ok(sb))
2035e776050aea Theodore Ts'o              2011-04-18  4775  			ext4_msg(sb,=
 KERN_INFO, "mounting ext2 file system "
2035e776050aea Theodore Ts'o              2011-04-18  4776  				 "using the=
 ext4 subsystem");
2035e776050aea Theodore Ts'o              2011-04-18  4777  		else {
0d9366d67bcf06 Eric Sandeen               2018-03-22  4778  			/*
0d9366d67bcf06 Eric Sandeen               2018-03-22  4779  			 * If we're =
probing be silent, if this looks like
0d9366d67bcf06 Eric Sandeen               2018-03-22  4780  			 * it's actu=
ally an ext[34] filesystem.
0d9366d67bcf06 Eric Sandeen               2018-03-22  4781  			 */
0d9366d67bcf06 Eric Sandeen               2018-03-22  4782  			if (silent &=
& ext4_feature_set_ok(sb, sb_rdonly(sb)))
0d9366d67bcf06 Eric Sandeen               2018-03-22  4783  				goto failed=
_mount;
2035e776050aea Theodore Ts'o              2011-04-18  4784  			ext4_msg(sb,=
 KERN_ERR, "couldn't mount as ext2 due "
2035e776050aea Theodore Ts'o              2011-04-18  4785  				 "to featur=
e incompatibilities");
2035e776050aea Theodore Ts'o              2011-04-18  4786  			goto failed_=
mount;
2035e776050aea Theodore Ts'o              2011-04-18  4787  		}
2035e776050aea Theodore Ts'o              2011-04-18  4788  	}
2035e776050aea Theodore Ts'o              2011-04-18  4789  =

2035e776050aea Theodore Ts'o              2011-04-18  4790  	if (IS_EXT3_SB=
(sb)) {
2035e776050aea Theodore Ts'o              2011-04-18  4791  		if (ext3_feat=
ure_set_ok(sb))
2035e776050aea Theodore Ts'o              2011-04-18  4792  			ext4_msg(sb,=
 KERN_INFO, "mounting ext3 file system "
2035e776050aea Theodore Ts'o              2011-04-18  4793  				 "using the=
 ext4 subsystem");
2035e776050aea Theodore Ts'o              2011-04-18  4794  		else {
0d9366d67bcf06 Eric Sandeen               2018-03-22  4795  			/*
0d9366d67bcf06 Eric Sandeen               2018-03-22  4796  			 * If we're =
probing be silent, if this looks like
0d9366d67bcf06 Eric Sandeen               2018-03-22  4797  			 * it's actu=
ally an ext4 filesystem.
0d9366d67bcf06 Eric Sandeen               2018-03-22  4798  			 */
0d9366d67bcf06 Eric Sandeen               2018-03-22  4799  			if (silent &=
& ext4_feature_set_ok(sb, sb_rdonly(sb)))
0d9366d67bcf06 Eric Sandeen               2018-03-22  4800  				goto failed=
_mount;
2035e776050aea Theodore Ts'o              2011-04-18  4801  			ext4_msg(sb,=
 KERN_ERR, "couldn't mount as ext3 due "
2035e776050aea Theodore Ts'o              2011-04-18  4802  				 "to featur=
e incompatibilities");
2035e776050aea Theodore Ts'o              2011-04-18  4803  			goto failed_=
mount;
2035e776050aea Theodore Ts'o              2011-04-18  4804  		}
2035e776050aea Theodore Ts'o              2011-04-18  4805  	}
2035e776050aea Theodore Ts'o              2011-04-18  4806  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  4807  	/*
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4808  	 * Check featu=
re flags regardless of the revision level, since we
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4809  	 * previously =
didn't change the revision level when setting the flags,
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4810  	 * so there is=
 a chance incompat flags are set on a rev 0 filesystem.
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4811  	 */
bc98a42c1f7d0f David Howells              2017-07-17  4812  	if (!ext4_feat=
ure_set_ok(sb, (sb_rdonly(sb))))
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4813  		goto failed_m=
ount;
a13fb1a4533f26 Eric Sandeen               2009-08-18  4814  =

5b9554dc5bf008 Theodore Ts'o              2016-07-05  4815  	if (le16_to_cp=
u(sbi->s_es->s_reserved_gdt_blocks) > (blocksize / 4)) {
5b9554dc5bf008 Theodore Ts'o              2016-07-05  4816  		ext4_msg(sb, =
KERN_ERR,
5b9554dc5bf008 Theodore Ts'o              2016-07-05  4817  			 "Number of =
reserved GDT blocks insanely large: %d",
5b9554dc5bf008 Theodore Ts'o              2016-07-05  4818  			 le16_to_cpu=
(sbi->s_es->s_reserved_gdt_blocks));
5b9554dc5bf008 Theodore Ts'o              2016-07-05  4819  		goto failed_m=
ount;
5b9554dc5bf008 Theodore Ts'o              2016-07-05  4820  	}
5b9554dc5bf008 Theodore Ts'o              2016-07-05  4821  =

7edfd85b1ffd36 Lukas Czerner              2021-10-27  4822  	if (dax_suppor=
ted(sbi->s_daxdev, sb->s_bdev, blocksize, 0,
bdd3c50d83bf7f Christoph Hellwig          2021-08-26  4823  			bdev_nr_sect=
ors(sb->s_bdev)))
a8ab6d3885ef5e Ira Weiny                  2020-05-28  4824  		set_bit(EXT4_=
FLAGS_BDEV_IS_DAX, &sbi->s_ext4_flags);
a8ab6d3885ef5e Ira Weiny                  2020-05-28  4825  =

fc626fe322f13e Ira Weiny                  2020-05-28 @4826  	if (sbi->s_mou=
nt_opt & EXT4_MOUNT_DAX_ALWAYS) {
559db4c6d784ce Ross Zwisler               2017-10-12  4827  		if (ext4_has_=
feature_inline_data(sb)) {
559db4c6d784ce Ross Zwisler               2017-10-12  4828  			ext4_msg(sb,=
 KERN_ERR, "Cannot use DAX on a filesystem"
559db4c6d784ce Ross Zwisler               2017-10-12  4829  					" that may=
 contain inline data");
361d24d40657d2 Eric Sandeen               2018-12-04  4830  			goto failed_=
mount;
559db4c6d784ce Ross Zwisler               2017-10-12  4831  		}
a8ab6d3885ef5e Ira Weiny                  2020-05-28  4832  		if (!test_bit=
(EXT4_FLAGS_BDEV_IS_DAX, &sbi->s_ext4_flags)) {
24f3478d664b1e Dan Williams               2017-12-21  4833  			ext4_msg(sb,=
 KERN_ERR,
361d24d40657d2 Eric Sandeen               2018-12-04  4834  				"DAX unsupp=
orted by block device.");
361d24d40657d2 Eric Sandeen               2018-12-04  4835  			goto failed_=
mount;
24f3478d664b1e Dan Williams               2017-12-21  4836  		}
923ae0ff925043 Ross Zwisler               2015-02-16  4837  	}
923ae0ff925043 Ross Zwisler               2015-02-16  4838  =

e2b911c53584a9 Darrick J. Wong            2015-10-17  4839  	if (ext4_has_f=
eature_encrypt(sb) && es->s_encryption_level) {
6ddb2447846a8e Theodore Ts'o              2015-04-16  4840  		ext4_msg(sb, =
KERN_ERR, "Unsupported encryption level %d",
6ddb2447846a8e Theodore Ts'o              2015-04-16  4841  			 es->s_encry=
ption_level);
6ddb2447846a8e Theodore Ts'o              2015-04-16  4842  		goto failed_m=
ount;
6ddb2447846a8e Theodore Ts'o              2015-04-16  4843  	}
6ddb2447846a8e Theodore Ts'o              2015-04-16  4844  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  4845  	if (sb->s_bloc=
ksize !=3D blocksize) {
afd09b617db378 Alexey Makhalov            2021-05-21  4846  		/*
afd09b617db378 Alexey Makhalov            2021-05-21  4847  		 * bh must be=
 released before kill_bdev(), otherwise
afd09b617db378 Alexey Makhalov            2021-05-21  4848  		 * it won't b=
e freed and its page also. kill_bdev()
afd09b617db378 Alexey Makhalov            2021-05-21  4849  		 * is called =
by sb_set_blocksize().
afd09b617db378 Alexey Makhalov            2021-05-21  4850  		 */
afd09b617db378 Alexey Makhalov            2021-05-21  4851  		brelse(bh);
ce40733ce93de4 Aneesh Kumar K.V           2008-01-28  4852  		/* Validate t=
he filesystem blocksize */
ce40733ce93de4 Aneesh Kumar K.V           2008-01-28  4853  		if (!sb_set_b=
locksize(sb, blocksize)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  4854  			ext4_msg(sb,=
 KERN_ERR, "bad block size %d",
ce40733ce93de4 Aneesh Kumar K.V           2008-01-28  4855  					blocksize);
afd09b617db378 Alexey Makhalov            2021-05-21  4856  			bh =3D NULL;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4857  			goto failed_=
mount;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4858  		}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4859  =

7edfd85b1ffd36 Lukas Czerner              2021-10-27  4860  		logical_sb_bl=
ock =3D sbi->s_sb_block * EXT4_MIN_BLOCK_SIZE;
70bbb3e0a07c1f Andrew Morton              2006-10-11  4861  		offset =3D do=
_div(logical_sb_block, blocksize);
8394a6abf3aeaa zhangyi (F                 2020-09-24  4862) 		bh =3D ext4_s=
b_bread_unmovable(sb, logical_sb_block);
8394a6abf3aeaa zhangyi (F                 2020-09-24  4863) 		if (IS_ERR(bh=
)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  4864  			ext4_msg(sb,=
 KERN_ERR,
b31e15527a9bb7 Eric Sandeen               2009-06-04  4865  			       "Can'=
t read superblock on 2nd try");
8394a6abf3aeaa zhangyi (F                 2020-09-24  4866) 			ret =3D PTR_=
ERR(bh);
8394a6abf3aeaa zhangyi (F                 2020-09-24  4867) 			bh =3D NULL;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4868  			goto failed_=
mount;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4869  		}
2716b80284c5ca Theodore Ts'o              2012-05-28  4870  		es =3D (struc=
t ext4_super_block *)(bh->b_data + offset);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4871  		sbi->s_es =3D=
 es;
617ba13b31fbf5 Mingming Cao               2006-10-11  4872  		if (es->s_mag=
ic !=3D cpu_to_le16(EXT4_SUPER_MAGIC)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  4873  			ext4_msg(sb,=
 KERN_ERR,
b31e15527a9bb7 Eric Sandeen               2009-06-04  4874  			       "Magi=
c mismatch, very weird!");
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4875  			goto failed_=
mount;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4876  		}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4877  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4878  =

e2b911c53584a9 Darrick J. Wong            2015-10-17  4879  	has_huge_files=
 =3D ext4_has_feature_huge_file(sb);
f287a1a56130be Theodore Ts'o              2008-10-16  4880  	sbi->s_bitmap_=
maxbytes =3D ext4_max_bitmap_size(sb->s_blocksize_bits,
f287a1a56130be Theodore Ts'o              2008-10-16  4881  						      has=
_huge_files);
f287a1a56130be Theodore Ts'o              2008-10-16  4882  	sb->s_maxbytes=
 =3D ext4_max_size(sb->s_blocksize_bits, has_huge_files);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4883  =

0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4884  	sbi->s_desc_si=
ze =3D le16_to_cpu(es->s_desc_size);
e2b911c53584a9 Darrick J. Wong            2015-10-17  4885  	if (ext4_has_f=
eature_64bit(sb)) {
8fadc14323684c Alexandre Ratchov          2006-10-11  4886  		if (sbi->s_de=
sc_size < EXT4_MIN_DESC_SIZE_64BIT ||
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4887  		    sbi->s_de=
sc_size > EXT4_MAX_DESC_SIZE ||
d8ea6cf8999100 vignesh babu               2007-10-16  4888  		    !is_power=
_of_2(sbi->s_desc_size)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  4889  			ext4_msg(sb,=
 KERN_ERR,
b31e15527a9bb7 Eric Sandeen               2009-06-04  4890  			       "unsu=
pported descriptor size %lu",
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4891  			       sbi->=
s_desc_size);
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4892  			goto failed_=
mount;
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4893  		}
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4894  	} else
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4895  		sbi->s_desc_s=
ize =3D EXT4_MIN_DESC_SIZE;
0b8e58a140cae2 Andreas Dilger             2009-06-03  4896  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  4897  	sbi->s_blocks_=
per_group =3D le32_to_cpu(es->s_blocks_per_group);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4898  	sbi->s_inodes_=
per_group =3D le32_to_cpu(es->s_inodes_per_group);
0b8e58a140cae2 Andreas Dilger             2009-06-03  4899  =

617ba13b31fbf5 Mingming Cao               2006-10-11  4900  	sbi->s_inodes_=
per_block =3D blocksize / EXT4_INODE_SIZE(sb);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4901  	if (sbi->s_ino=
des_per_block =3D=3D 0)
617ba13b31fbf5 Mingming Cao               2006-10-11  4902  		goto cantfind=
_ext4;
cd6bb35bf7f6d7 Theodore Ts'o              2016-11-18  4903  	if (sbi->s_ino=
des_per_group < sbi->s_inodes_per_block ||
cd6bb35bf7f6d7 Theodore Ts'o              2016-11-18  4904  	    sbi->s_ino=
des_per_group > blocksize * 8) {
cd6bb35bf7f6d7 Theodore Ts'o              2016-11-18  4905  		ext4_msg(sb, =
KERN_ERR, "invalid inodes per group: %lu\n",
b9c538da4e52a7 Josh Triplett              2020-03-28  4906  			 sbi->s_inod=
es_per_group);
cd6bb35bf7f6d7 Theodore Ts'o              2016-11-18  4907  		goto failed_m=
ount;
cd6bb35bf7f6d7 Theodore Ts'o              2016-11-18  4908  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4909  	sbi->s_itb_per=
_group =3D sbi->s_inodes_per_group /
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4910  					sbi->s_ino=
des_per_block;
0d1ee42f27d30e Alexandre Ratchov          2006-10-11  4911  	sbi->s_desc_pe=
r_block =3D blocksize / EXT4_DESC_SIZE(sb);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4912  	sbi->s_sbh =3D=
 bh;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4913  	sbi->s_mount_s=
tate =3D le16_to_cpu(es->s_state);
e57aa839cea138 Fengguang Wu               2007-10-16  4914  	sbi->s_addr_pe=
r_block_bits =3D ilog2(EXT4_ADDR_PER_BLOCK(sb));
e57aa839cea138 Fengguang Wu               2007-10-16  4915  	sbi->s_desc_pe=
r_block_bits =3D ilog2(EXT4_DESC_PER_BLOCK(sb));
0b8e58a140cae2 Andreas Dilger             2009-06-03  4916  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  4917  	for (i =3D 0; =
i < 4; i++)
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4918  		sbi->s_hash_s=
eed[i] =3D le32_to_cpu(es->s_hash_seed[i]);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4919  	sbi->s_def_has=
h_version =3D es->s_def_hash_version;
e2b911c53584a9 Darrick J. Wong            2015-10-17  4920  	if (ext4_has_f=
eature_dir_index(sb)) {
f99b25897a86fc Theodore Ts'o              2008-10-28  4921  		i =3D le32_to=
_cpu(es->s_flags);
f99b25897a86fc Theodore Ts'o              2008-10-28  4922  		if (i & EXT2_=
FLAGS_UNSIGNED_HASH)
f99b25897a86fc Theodore Ts'o              2008-10-28  4923  			sbi->s_hash_=
unsigned =3D 3;
f99b25897a86fc Theodore Ts'o              2008-10-28  4924  		else if ((i &=
 EXT2_FLAGS_SIGNED_HASH) =3D=3D 0) {
f99b25897a86fc Theodore Ts'o              2008-10-28  4925  #ifdef __CHAR_U=
NSIGNED__
bc98a42c1f7d0f David Howells              2017-07-17  4926  			if (!sb_rdon=
ly(sb))
23301410972330 Theodore Ts'o              2014-02-12  4927  				es->s_flags=
 |=3D
23301410972330 Theodore Ts'o              2014-02-12  4928  					cpu_to_le3=
2(EXT2_FLAGS_UNSIGNED_HASH);
f99b25897a86fc Theodore Ts'o              2008-10-28  4929  			sbi->s_hash_=
unsigned =3D 3;
f99b25897a86fc Theodore Ts'o              2008-10-28  4930  #else
bc98a42c1f7d0f David Howells              2017-07-17  4931  			if (!sb_rdon=
ly(sb))
23301410972330 Theodore Ts'o              2014-02-12  4932  				es->s_flags=
 |=3D
23301410972330 Theodore Ts'o              2014-02-12  4933  					cpu_to_le3=
2(EXT2_FLAGS_SIGNED_HASH);
f99b25897a86fc Theodore Ts'o              2008-10-28  4934  #endif
f99b25897a86fc Theodore Ts'o              2008-10-28  4935  		}
23301410972330 Theodore Ts'o              2014-02-12  4936  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4937  =

281b59959707df Theodore Ts'o              2011-09-09  4938  	/* Handle clus=
tersize */
281b59959707df Theodore Ts'o              2011-09-09  4939  	clustersize =
=3D BLOCK_SIZE << le32_to_cpu(es->s_log_cluster_size);
ef5fd681d5159d Kaixu Xia                  2020-04-15  4940  	if (ext4_has_f=
eature_bigalloc(sb)) {
281b59959707df Theodore Ts'o              2011-09-09  4941  		if (clustersi=
ze < blocksize) {
281b59959707df Theodore Ts'o              2011-09-09  4942  			ext4_msg(sb,=
 KERN_ERR,
281b59959707df Theodore Ts'o              2011-09-09  4943  				 "cluster s=
ize (%d) smaller than "
281b59959707df Theodore Ts'o              2011-09-09  4944  				 "block siz=
e (%d)", clustersize, blocksize);
281b59959707df Theodore Ts'o              2011-09-09  4945  			goto failed_=
mount;
281b59959707df Theodore Ts'o              2011-09-09  4946  		}
281b59959707df Theodore Ts'o              2011-09-09  4947  		sbi->s_cluste=
r_bits =3D le32_to_cpu(es->s_log_cluster_size) -
281b59959707df Theodore Ts'o              2011-09-09  4948  			le32_to_cpu(=
es->s_log_block_size);
281b59959707df Theodore Ts'o              2011-09-09  4949  		sbi->s_cluste=
rs_per_group =3D
281b59959707df Theodore Ts'o              2011-09-09  4950  			le32_to_cpu(=
es->s_clusters_per_group);
281b59959707df Theodore Ts'o              2011-09-09  4951  		if (sbi->s_cl=
usters_per_group > blocksize * 8) {
281b59959707df Theodore Ts'o              2011-09-09  4952  			ext4_msg(sb,=
 KERN_ERR,
281b59959707df Theodore Ts'o              2011-09-09  4953  				 "#clusters=
 per group too big: %lu",
281b59959707df Theodore Ts'o              2011-09-09  4954  				 sbi->s_clu=
sters_per_group);
281b59959707df Theodore Ts'o              2011-09-09  4955  			goto failed_=
mount;
281b59959707df Theodore Ts'o              2011-09-09  4956  		}
281b59959707df Theodore Ts'o              2011-09-09  4957  		if (sbi->s_bl=
ocks_per_group !=3D
281b59959707df Theodore Ts'o              2011-09-09  4958  		    (sbi->s_c=
lusters_per_group * (clustersize / blocksize))) {
281b59959707df Theodore Ts'o              2011-09-09  4959  			ext4_msg(sb,=
 KERN_ERR, "blocks per group (%lu) and "
281b59959707df Theodore Ts'o              2011-09-09  4960  				 "clusters =
per group (%lu) inconsistent",
281b59959707df Theodore Ts'o              2011-09-09  4961  				 sbi->s_blo=
cks_per_group,
281b59959707df Theodore Ts'o              2011-09-09  4962  				 sbi->s_clu=
sters_per_group);
281b59959707df Theodore Ts'o              2011-09-09  4963  			goto failed_=
mount;
281b59959707df Theodore Ts'o              2011-09-09  4964  		}
281b59959707df Theodore Ts'o              2011-09-09  4965  	} else {
281b59959707df Theodore Ts'o              2011-09-09  4966  		if (clustersi=
ze !=3D blocksize) {
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  4967  			ext4_msg(sb,=
 KERN_ERR,
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  4968  				 "fragment/=
cluster size (%d) !=3D "
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  4969  				 "block siz=
e (%d)", clustersize, blocksize);
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  4970  			goto failed_=
mount;
281b59959707df Theodore Ts'o              2011-09-09  4971  		}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4972  		if (sbi->s_bl=
ocks_per_group > blocksize * 8) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  4973  			ext4_msg(sb,=
 KERN_ERR,
b31e15527a9bb7 Eric Sandeen               2009-06-04  4974  				 "#blocks p=
er group too big: %lu",
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4975  				 sbi->s_blo=
cks_per_group);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4976  			goto failed_=
mount;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4977  		}
281b59959707df Theodore Ts'o              2011-09-09  4978  		sbi->s_cluste=
rs_per_group =3D sbi->s_blocks_per_group;
281b59959707df Theodore Ts'o              2011-09-09  4979  		sbi->s_cluste=
r_bits =3D 0;
281b59959707df Theodore Ts'o              2011-09-09  4980  	}
281b59959707df Theodore Ts'o              2011-09-09  4981  	sbi->s_cluster=
_ratio =3D clustersize / blocksize;
281b59959707df Theodore Ts'o              2011-09-09  4982  =

960fd856fdc3b0 Theodore Ts'o              2013-07-05  4983  	/* Do we have =
standard group size of clustersize * 8 blocks ? */
960fd856fdc3b0 Theodore Ts'o              2013-07-05  4984  	if (sbi->s_blo=
cks_per_group =3D=3D clustersize << 3)
960fd856fdc3b0 Theodore Ts'o              2013-07-05  4985  		set_opt2(sb, =
STD_GROUP_SIZE);
960fd856fdc3b0 Theodore Ts'o              2013-07-05  4986  =

bf43d84b185e2f Eric Sandeen               2009-08-17  4987  	/*
bf43d84b185e2f Eric Sandeen               2009-08-17  4988  	 * Test whethe=
r we have more sectors than will fit in sector_t,
bf43d84b185e2f Eric Sandeen               2009-08-17  4989  	 * and whether=
 the max offset is addressable by the page cache.
bf43d84b185e2f Eric Sandeen               2009-08-17  4990  	 */
5a9ae68a349aa0 Darrick J. Wong            2010-11-19  4991  	err =3D generi=
c_check_addressable(sb->s_blocksize_bits,
30ca22c70e3ef0 Patrick J. LoPresti        2010-07-22  4992  					ext4_block=
s_count(es));
5a9ae68a349aa0 Darrick J. Wong            2010-11-19  4993  	if (err) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  4994  		ext4_msg(sb, =
KERN_ERR, "filesystem"
bf43d84b185e2f Eric Sandeen               2009-08-17  4995  			 " too large=
 to mount safely on this system");
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4996  		goto failed_m=
ount;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4997  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  4998  =

617ba13b31fbf5 Mingming Cao               2006-10-11  4999  	if (EXT4_BLOCK=
S_PER_GROUP(sb) =3D=3D 0)
617ba13b31fbf5 Mingming Cao               2006-10-11  5000  		goto cantfind=
_ext4;
e7c95593001cb9 Eric Sandeen               2008-01-28  5001  =

0f2ddca66d70c8 From: Thiemo Nagel         2009-04-07  5002  	/* check block=
s count against device size */
5513b241b2ef90 Christoph Hellwig          2021-10-18  5003  	blocks_count =
=3D sb_bdev_nr_blocks(sb);
0f2ddca66d70c8 From: Thiemo Nagel         2009-04-07  5004  	if (blocks_cou=
nt && ext4_blocks_count(es) > blocks_count) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5005  		ext4_msg(sb, =
KERN_WARNING, "bad geometry: block count %llu "
b31e15527a9bb7 Eric Sandeen               2009-06-04  5006  		       "excee=
ds size of device (%llu blocks)",
0f2ddca66d70c8 From: Thiemo Nagel         2009-04-07  5007  		       ext4_b=
locks_count(es), blocks_count);
0f2ddca66d70c8 From: Thiemo Nagel         2009-04-07  5008  		goto failed_m=
ount;
0f2ddca66d70c8 From: Thiemo Nagel         2009-04-07  5009  	}
0f2ddca66d70c8 From: Thiemo Nagel         2009-04-07  5010  =

4ec11028137982 Theodore Ts'o              2009-01-06  5011  	/*
4ec11028137982 Theodore Ts'o              2009-01-06  5012  	 * It makes no=
 sense for the first data block to be beyond the end
4ec11028137982 Theodore Ts'o              2009-01-06  5013  	 * of the file=
system.
4ec11028137982 Theodore Ts'o              2009-01-06  5014  	 */
4ec11028137982 Theodore Ts'o              2009-01-06  5015  	if (le32_to_cp=
u(es->s_first_data_block) >=3D ext4_blocks_count(es)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5016  		ext4_msg(sb, =
KERN_WARNING, "bad geometry: first data "
b31e15527a9bb7 Eric Sandeen               2009-06-04  5017  			 "block %u i=
s beyond end of filesystem (%llu)",
e7c95593001cb9 Eric Sandeen               2008-01-28  5018  			 le32_to_cpu=
(es->s_first_data_block),
4ec11028137982 Theodore Ts'o              2009-01-06  5019  			 ext4_blocks=
_count(es));
e7c95593001cb9 Eric Sandeen               2008-01-28  5020  		goto failed_m=
ount;
e7c95593001cb9 Eric Sandeen               2008-01-28  5021  	}
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5022  	if ((es->s_fir=
st_data_block =3D=3D 0) && (es->s_log_block_size =3D=3D 0) &&
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5023  	    (sbi->s_cl=
uster_ratio =3D=3D 1)) {
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5024  		ext4_msg(sb, =
KERN_WARNING, "bad geometry: first data "
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5025  			 "block is 0=
 with a 1k block and cluster size");
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5026  		goto failed_m=
ount;
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5027  	}
bfe0a5f47ada40 Theodore Ts'o              2018-06-17  5028  =

bd81d8eec04309 Laurent Vivier             2006-10-11  5029  	blocks_count =
=3D (ext4_blocks_count(es) -
bd81d8eec04309 Laurent Vivier             2006-10-11  5030  			le32_to_cpu(=
es->s_first_data_block) +
bd81d8eec04309 Laurent Vivier             2006-10-11  5031  			EXT4_BLOCKS_=
PER_GROUP(sb) - 1);
bd81d8eec04309 Laurent Vivier             2006-10-11  5032  	do_div(blocks_=
count, EXT4_BLOCKS_PER_GROUP(sb));
4ec11028137982 Theodore Ts'o              2009-01-06  5033  	if (blocks_cou=
nt > ((uint64_t)1<<32) - EXT4_DESC_PER_BLOCK(sb)) {
df41460a21b06a Josh Triplett              2020-03-28  5034  		ext4_msg(sb, =
KERN_WARNING, "groups count too large: %llu "
4ec11028137982 Theodore Ts'o              2009-01-06  5035  		       "(bloc=
k count %llu, first data block %u, "
df41460a21b06a Josh Triplett              2020-03-28  5036  		       "block=
s per group %lu)", blocks_count,
4ec11028137982 Theodore Ts'o              2009-01-06  5037  		       ext4_b=
locks_count(es),
4ec11028137982 Theodore Ts'o              2009-01-06  5038  		       le32_t=
o_cpu(es->s_first_data_block),
4ec11028137982 Theodore Ts'o              2009-01-06  5039  		       EXT4_B=
LOCKS_PER_GROUP(sb));
4ec11028137982 Theodore Ts'o              2009-01-06  5040  		goto failed_m=
ount;
4ec11028137982 Theodore Ts'o              2009-01-06  5041  	}
bd81d8eec04309 Laurent Vivier             2006-10-11  5042  	sbi->s_groups_=
count =3D blocks_count;
fb0a387dcdcd21 Eric Sandeen               2009-09-16  5043  	sbi->s_blockfi=
le_groups =3D min_t(ext4_group_t, sbi->s_groups_count,
fb0a387dcdcd21 Eric Sandeen               2009-09-16  5044  			(EXT4_MAX_BL=
OCK_FILE_PHYS / EXT4_BLOCKS_PER_GROUP(sb)));
9e463084cdb22e Theodore Ts'o              2018-11-07  5045  	if (((u64)sbi-=
>s_groups_count * sbi->s_inodes_per_group) !=3D
9e463084cdb22e Theodore Ts'o              2018-11-07  5046  	    le32_to_cp=
u(es->s_inodes_count)) {
9e463084cdb22e Theodore Ts'o              2018-11-07  5047  		ext4_msg(sb, =
KERN_ERR, "inodes count not valid: %u vs %llu",
9e463084cdb22e Theodore Ts'o              2018-11-07  5048  			 le32_to_cpu=
(es->s_inodes_count),
9e463084cdb22e Theodore Ts'o              2018-11-07  5049  			 ((u64)sbi->=
s_groups_count * sbi->s_inodes_per_group));
9e463084cdb22e Theodore Ts'o              2018-11-07  5050  		ret =3D -EINV=
AL;
9e463084cdb22e Theodore Ts'o              2018-11-07  5051  		goto failed_m=
ount;
9e463084cdb22e Theodore Ts'o              2018-11-07  5052  	}
617ba13b31fbf5 Mingming Cao               2006-10-11  5053  	db_count =3D (=
sbi->s_groups_count + EXT4_DESC_PER_BLOCK(sb) - 1) /
617ba13b31fbf5 Mingming Cao               2006-10-11  5054  		   EXT4_DESC_=
PER_BLOCK(sb);
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5055  	if (ext4_has_f=
eature_meta_bg(sb)) {
2ba3e6e8afc9b6 Theodore Ts'o              2017-02-15  5056  		if (le32_to_c=
pu(es->s_first_meta_bg) > db_count) {
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5057  			ext4_msg(sb,=
 KERN_WARNING,
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5058  				 "first met=
a block group too large: %u "
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5059  				 "(group de=
scriptor block count %u)",
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5060  				 le32_to_cp=
u(es->s_first_meta_bg), db_count);
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5061  			goto failed_=
mount;
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5062  		}
3a4b77cd47bb83 Eryu Guan                  2016-12-01  5063  	}
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5064  	rcu_assign_poi=
nter(sbi->s_group_desc,
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5065  			   kvmalloc_=
array(db_count,
f18a5f21c25707 Theodore Ts'o              2011-08-01  5066  					  sizeof(s=
truct buffer_head *),
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5067  					  GFP_KERN=
EL));
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5068  	if (sbi->s_gro=
up_desc =3D=3D NULL) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5069  		ext4_msg(sb, =
KERN_ERR, "not enough memory");
2cde417de013b2 Theodore Ts'o              2012-05-28  5070  		ret =3D -ENOM=
EM;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5071  		goto failed_m=
ount;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5072  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5073  =

705895b61133ef Pekka Enberg               2009-02-15  5074  	bgl_lock_init(=
sbi->s_blockgroup_lock);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5075  =

85c8f176a6111e Andrew Perepechko          2017-04-30  5076  	/* Pre-read th=
e descriptors into the buffer cache */
85c8f176a6111e Andrew Perepechko          2017-04-30  5077  	for (i =3D 0; =
i < db_count; i++) {
85c8f176a6111e Andrew Perepechko          2017-04-30  5078  		block =3D des=
criptor_loc(sb, logical_sb_block, i);
5df1d4123d5326 zhangyi (F                 2020-09-24  5079) 		ext4_sb_bread=
ahead_unmovable(sb, block);
85c8f176a6111e Andrew Perepechko          2017-04-30  5080  	}
85c8f176a6111e Andrew Perepechko          2017-04-30  5081  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5082  	for (i =3D 0; =
i < db_count; i++) {
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5083  		struct buffer=
_head *bh;
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5084  =

70bbb3e0a07c1f Andrew Morton              2006-10-11  5085  		block =3D des=
criptor_loc(sb, logical_sb_block, i);
8394a6abf3aeaa zhangyi (F                 2020-09-24  5086) 		bh =3D ext4_s=
b_bread_unmovable(sb, block);
8394a6abf3aeaa zhangyi (F                 2020-09-24  5087) 		if (IS_ERR(bh=
)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5088  			ext4_msg(sb,=
 KERN_ERR,
b31e15527a9bb7 Eric Sandeen               2009-06-04  5089  			       "can'=
t read group descriptor %d", i);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5090  			db_count =3D=
 i;
8394a6abf3aeaa zhangyi (F                 2020-09-24  5091) 			ret =3D PTR_=
ERR(bh);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5092  			goto failed_=
mount2;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5093  		}
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5094  		rcu_read_lock=
();
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5095  		rcu_dereferen=
ce(sbi->s_group_desc)[i] =3D bh;
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5096  		rcu_read_unlo=
ck();
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5097  	}
44de022c438254 Theodore Ts'o              2018-07-08  5098  	sbi->s_gdb_cou=
nt =3D db_count;
829fa70dddadf9 Theodore Ts'o              2016-08-01  5099  	if (!ext4_chec=
k_descriptors(sb, logical_sb_block, &first_not_zeroed)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5100  		ext4_msg(sb, =
KERN_ERR, "group descriptors corrupted!");
6a797d27378389 Darrick J. Wong            2015-10-17  5101  		ret =3D -EFSC=
ORRUPTED;
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5102  		goto failed_m=
ount2;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5103  	}
772cb7c83ba256 Jose R. Santos             2008-07-11  5104  =

235699a8f457ed Kees Cook                  2017-10-18  5105  	timer_setup(&s=
bi->s_err_report, print_daily_error_info, 0);
c92dc856848f32 Jan Kara                   2020-11-27  5106  	spin_lock_init=
(&sbi->s_error_lock);
c92dc856848f32 Jan Kara                   2020-11-27  5107  	INIT_WORK(&sbi=
->s_error_work, flush_stashed_error_work);
0449641130f565 Tao Ma                     2011-04-05  5108  =

a75ae78f087f93 Dmitry Monakhov            2013-04-03  5109  	/* Register ex=
tent status tree shrinker */
eb68d0e2fc5a4e Zheng Liu                  2014-09-01  5110  	if (ext4_es_re=
gister_shrinker(sbi))
ce7e010aef63dc Theodore Ts'o              2010-11-03  5111  		goto failed_m=
ount3;
ce7e010aef63dc Theodore Ts'o              2010-11-03  5112  =

c9de560ded61fa Alex Tomas                 2008-01-29  5113  	sbi->s_stripe =
=3D ext4_get_stripe_size(sbi);
67a5da564f97f3 Zheng Liu                  2012-08-17  5114  	sbi->s_extent_=
max_zeroout_kb =3D 32;
c9de560ded61fa Alex Tomas                 2008-01-29  5115  =

f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5116  	/*
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5117  	 * set up enou=
gh so that it can read an inode
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5118  	 */
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5119  	sb->s_op =3D &=
ext4_sops;
617ba13b31fbf5 Mingming Cao               2006-10-11  5120  	sb->s_export_o=
p =3D &ext4_export_ops;
617ba13b31fbf5 Mingming Cao               2006-10-11  5121  	sb->s_xattr =
=3D ext4_xattr_handlers;
643fa9612bf1a2 Chandan Rajendra           2018-12-12  5122  #ifdef CONFIG_F=
S_ENCRYPTION
a7550b30ab709f Jaegeuk Kim                2016-07-10  5123  	sb->s_cop =3D =
&ext4_cryptops;
ffcc41829ae043 Eric Biggers               2017-10-09  5124  #endif
c93d8f88580921 Eric Biggers               2019-07-22  5125  #ifdef CONFIG_F=
S_VERITY
c93d8f88580921 Eric Biggers               2019-07-22  5126  	sb->s_vop =3D =
&ext4_verityops;
c93d8f88580921 Eric Biggers               2019-07-22  5127  #endif
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5128  #ifdef CONFIG_Q=
UOTA
617ba13b31fbf5 Mingming Cao               2006-10-11  5129  	sb->dq_op =3D =
&ext4_quota_operations;
e2b911c53584a9 Darrick J. Wong            2015-10-17  5130  	if (ext4_has_f=
eature_quota(sb))
1fa5efe3622db5 Jan Kara                   2014-10-08  5131  		sb->s_qcop =
=3D &dquot_quotactl_sysfile_ops;
262b4662f42787 Jan Kara                   2013-03-02  5132  	else
262b4662f42787 Jan Kara                   2013-03-02  5133  		sb->s_qcop =
=3D &ext4_qctl_operations;
689c958cbe6be4 Li Xi                      2016-01-08  5134  	sb->s_quota_ty=
pes =3D QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5135  #endif
85787090a21eb7 Christoph Hellwig          2017-05-10  5136  	memcpy(&sb->s_=
uuid, es->s_uuid, sizeof(es->s_uuid));
f2fa2ffc2046fd Aneesh Kumar K.V           2011-01-29  5137  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5138  	INIT_LIST_HEAD=
(&sbi->s_orphan); /* unlinked but open files */
3b9d4ed2668077 Theodore Ts'o              2009-04-25  5139  	mutex_init(&sb=
i->s_orphan_lock);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5140  =

aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5141  	/* Initialize =
fast commit stuff */
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5142  	atomic_set(&sb=
i->s_fc_subtid, 0);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5143  	atomic_set(&sb=
i->s_fc_ineligible_updates, 0);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5144  	INIT_LIST_HEAD=
(&sbi->s_fc_q[FC_Q_MAIN]);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5145  	INIT_LIST_HEAD=
(&sbi->s_fc_q[FC_Q_STAGING]);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5146  	INIT_LIST_HEAD=
(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5147  	INIT_LIST_HEAD=
(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5148  	sbi->s_fc_byte=
s =3D 0;
9b5f6c9b83d912 Harshad Shirwadkar         2020-11-05  5149  	ext4_clear_mou=
nt_flag(sb, EXT4_MF_FC_INELIGIBLE);
9b5f6c9b83d912 Harshad Shirwadkar         2020-11-05  5150  	ext4_clear_mou=
nt_flag(sb, EXT4_MF_FC_COMMITTING);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5151  	spin_lock_init=
(&sbi->s_fc_lock);
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5152  	memset(&sbi->s=
_fc_stats, 0, sizeof(sbi->s_fc_stats));
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5153  	sbi->s_fc_repl=
ay_state.fc_regions =3D NULL;
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5154  	sbi->s_fc_repl=
ay_state.fc_regions_size =3D 0;
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5155  	sbi->s_fc_repl=
ay_state.fc_regions_used =3D 0;
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5156  	sbi->s_fc_repl=
ay_state.fc_regions_valid =3D 0;
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5157  	sbi->s_fc_repl=
ay_state.fc_modified_inodes =3D NULL;
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5158  	sbi->s_fc_repl=
ay_state.fc_modified_inodes_size =3D 0;
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5159  	sbi->s_fc_repl=
ay_state.fc_modified_inodes_used =3D 0;
aa75f4d3daaeb1 Harshad Shirwadkar         2020-10-15  5160  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5161  	sb->s_root =3D=
 NULL;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5162  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5163  	needs_recovery=
 =3D (es->s_last_orphan !=3D 0 ||
02f310fcf47fa9 Jan Kara                   2021-08-16  5164  			  ext4_has_f=
eature_orphan_present(sb) ||
e2b911c53584a9 Darrick J. Wong            2015-10-17  5165  			  ext4_has_f=
eature_journal_needs_recovery(sb));
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5166  =

bc98a42c1f7d0f David Howells              2017-07-17  5167  	if (ext4_has_f=
eature_mmp(sb) && !sb_rdonly(sb))
c5e06d101aaf72 Johann Lombardi            2011-05-24  5168  		if (ext4_mult=
i_mount_protect(sb, le64_to_cpu(es->s_mmp_block)))
50460fe8c6d1d9 Darrick J. Wong            2014-10-30  5169  			goto failed_=
mount3a;
c5e06d101aaf72 Johann Lombardi            2011-05-24  5170  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5171  	/*
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5172  	 * The first i=
node we look at is the journal inode.  Don't try
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5173  	 * root first:=
 it may be modified in the journal!
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5174  	 */
e2b911c53584a9 Darrick J. Wong            2015-10-17  5175  	if (!test_opt(=
sb, NOLOAD) && ext4_has_feature_journal(sb)) {
7edfd85b1ffd36 Lukas Czerner              2021-10-27  5176  		err =3D ext4_=
load_journal(sb, es, ctx->journal_devnum);
4753d8a24d4588 Theodore Ts'o              2017-02-05  5177  		if (err)
50460fe8c6d1d9 Darrick J. Wong            2014-10-30  5178  			goto failed_=
mount3a;
bc98a42c1f7d0f David Howells              2017-07-17  5179  	} else if (tes=
t_opt(sb, NOLOAD) && !sb_rdonly(sb) &&
e2b911c53584a9 Darrick J. Wong            2015-10-17  5180  		   ext4_has_f=
eature_journal_needs_recovery(sb)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5181  		ext4_msg(sb, =
KERN_ERR, "required journal recovery "
b31e15527a9bb7 Eric Sandeen               2009-06-04  5182  		       "suppr=
essed and not mounted read-only");
744692dc059845 Jiaying Zhang              2010-03-04  5183  		goto failed_m=
ount_wq;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5184  	} else {
1e381f60dad913 Dmitry Monakhov            2015-10-18  5185  		/* Nojournal =
mode, all journal mount options are illegal */
1e381f60dad913 Dmitry Monakhov            2015-10-18  5186  		if (test_opt2=
(sb, EXPLICIT_JOURNAL_CHECKSUM)) {
1e381f60dad913 Dmitry Monakhov            2015-10-18  5187  			ext4_msg(sb,=
 KERN_ERR, "can't mount with "
1e381f60dad913 Dmitry Monakhov            2015-10-18  5188  				 "journal_c=
hecksum, fs mounted w/o journal");
1e381f60dad913 Dmitry Monakhov            2015-10-18  5189  			goto failed_=
mount_wq;
1e381f60dad913 Dmitry Monakhov            2015-10-18  5190  		}
1e381f60dad913 Dmitry Monakhov            2015-10-18  5191  		if (test_opt(=
sb, JOURNAL_ASYNC_COMMIT)) {
1e381f60dad913 Dmitry Monakhov            2015-10-18  5192  			ext4_msg(sb,=
 KERN_ERR, "can't mount with "
1e381f60dad913 Dmitry Monakhov            2015-10-18  5193  				 "journal_a=
sync_commit, fs mounted w/o journal");
1e381f60dad913 Dmitry Monakhov            2015-10-18  5194  			goto failed_=
mount_wq;
1e381f60dad913 Dmitry Monakhov            2015-10-18  5195  		}
1e381f60dad913 Dmitry Monakhov            2015-10-18  5196  		if (sbi->s_co=
mmit_interval !=3D JBD2_DEFAULT_MAX_COMMIT_AGE*HZ) {
1e381f60dad913 Dmitry Monakhov            2015-10-18  5197  			ext4_msg(sb,=
 KERN_ERR, "can't mount with "
1e381f60dad913 Dmitry Monakhov            2015-10-18  5198  				 "commit=3D=
%lu, fs mounted w/o journal",
1e381f60dad913 Dmitry Monakhov            2015-10-18  5199  				 sbi->s_com=
mit_interval / HZ);
1e381f60dad913 Dmitry Monakhov            2015-10-18  5200  			goto failed_=
mount_wq;
1e381f60dad913 Dmitry Monakhov            2015-10-18  5201  		}
1e381f60dad913 Dmitry Monakhov            2015-10-18  5202  		if (EXT4_MOUN=
T_DATA_FLAGS &
1e381f60dad913 Dmitry Monakhov            2015-10-18  5203  		    (sbi->s_m=
ount_opt ^ sbi->s_def_mount_opt)) {
1e381f60dad913 Dmitry Monakhov            2015-10-18  5204  			ext4_msg(sb,=
 KERN_ERR, "can't mount with "
1e381f60dad913 Dmitry Monakhov            2015-10-18  5205  				 "data=3D, =
fs mounted w/o journal");
1e381f60dad913 Dmitry Monakhov            2015-10-18  5206  			goto failed_=
mount_wq;
1e381f60dad913 Dmitry Monakhov            2015-10-18  5207  		}
50b29d8f033a7c Debabrata Banerjee         2019-04-30  5208  		sbi->s_def_mo=
unt_opt &=3D ~EXT4_MOUNT_JOURNAL_CHECKSUM;
1e381f60dad913 Dmitry Monakhov            2015-10-18  5209  		clear_opt(sb,=
 JOURNAL_CHECKSUM);
fd8c37eccdda21 Theodore Ts'o              2010-12-15  5210  		clear_opt(sb,=
 DATA_FLAGS);
995a3ed67fc8c0 Harshad Shirwadkar         2020-10-15  5211  		clear_opt2(sb=
, JOURNAL_FAST_COMMIT);
0390131ba84fd3 Frank Mayhar               2009-01-07  5212  		sbi->s_journa=
l =3D NULL;
0390131ba84fd3 Frank Mayhar               2009-01-07  5213  		needs_recover=
y =3D 0;
0390131ba84fd3 Frank Mayhar               2009-01-07  5214  		goto no_journ=
al;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5215  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5216  =

e2b911c53584a9 Darrick J. Wong            2015-10-17  5217  	if (ext4_has_f=
eature_64bit(sb) &&
eb40a09c679d7f Jose R. Santos             2007-07-18  5218  	    !jbd2_jour=
nal_set_features(EXT4_SB(sb)->s_journal, 0, 0,
eb40a09c679d7f Jose R. Santos             2007-07-18  5219  				       JBD2=
_FEATURE_INCOMPAT_64BIT)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5220  		ext4_msg(sb, =
KERN_ERR, "Failed to set 64-bit journal feature");
744692dc059845 Jiaying Zhang              2010-03-04  5221  		goto failed_m=
ount_wq;
eb40a09c679d7f Jose R. Santos             2007-07-18  5222  	}
eb40a09c679d7f Jose R. Santos             2007-07-18  5223  =

25ed6e8a54df90 Darrick J. Wong            2012-05-27  5224  	if (!set_journ=
al_csum_feature_set(sb)) {
25ed6e8a54df90 Darrick J. Wong            2012-05-27  5225  		ext4_msg(sb, =
KERN_ERR, "Failed to set journal checksum "
25ed6e8a54df90 Darrick J. Wong            2012-05-27  5226  			 "feature se=
t");
25ed6e8a54df90 Darrick J. Wong            2012-05-27  5227  		goto failed_m=
ount_wq;
d4da6c9ccf648f Linus Torvalds             2009-11-02  5228  	}
818d276ceb83aa Girish Shilamkar           2008-01-28  5229  =

a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5230  	if (test_opt2(=
sb, JOURNAL_FAST_COMMIT) &&
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5231  		!jbd2_journal=
_set_features(EXT4_SB(sb)->s_journal, 0, 0,
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5232  					  JBD2_FEA=
TURE_INCOMPAT_FAST_COMMIT)) {
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5233  		ext4_msg(sb, =
KERN_ERR,
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5234  			"Failed to s=
et fast commit journal feature");
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5235  		goto failed_m=
ount_wq;
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5236  	}
a1e5e465b31d60 Harshad Shirwadkar         2020-11-05  5237  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5238  	/* We have now=
 updated the journal if required, so we can
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5239  	 * validate th=
e data journaling mode. */
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5240  	switch (test_o=
pt(sb, DATA_FLAGS)) {
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5241  	case 0:
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5242  		/* No mode se=
t, assume a default based on the journal
63f5793351d821 Andrew Morton              2006-10-11  5243  		 * capabiliti=
es: ORDERED_DATA if the journal can
63f5793351d821 Andrew Morton              2006-10-11  5244  		 * cope, else=
 JOURNAL_DATA
63f5793351d821 Andrew Morton              2006-10-11  5245  		 */
dab291af8d6307 Mingming Cao               2006-10-11  5246  		if (jbd2_jour=
nal_check_available_features
27f394a7718d00 Tyson Nottingham           2018-03-30  5247  		    (sbi->s_j=
ournal, 0, 0, JBD2_FEATURE_INCOMPAT_REVOKE)) {
fd8c37eccdda21 Theodore Ts'o              2010-12-15  5248  			set_opt(sb, =
ORDERED_DATA);
27f394a7718d00 Tyson Nottingham           2018-03-30  5249  			sbi->s_def_m=
ount_opt |=3D EXT4_MOUNT_ORDERED_DATA;
27f394a7718d00 Tyson Nottingham           2018-03-30  5250  		} else {
fd8c37eccdda21 Theodore Ts'o              2010-12-15  5251  			set_opt(sb, =
JOURNAL_DATA);
27f394a7718d00 Tyson Nottingham           2018-03-30  5252  			sbi->s_def_m=
ount_opt |=3D EXT4_MOUNT_JOURNAL_DATA;
27f394a7718d00 Tyson Nottingham           2018-03-30  5253  		}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5254  		break;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5255  =

617ba13b31fbf5 Mingming Cao               2006-10-11  5256  	case EXT4_MOUN=
T_ORDERED_DATA:
617ba13b31fbf5 Mingming Cao               2006-10-11  5257  	case EXT4_MOUN=
T_WRITEBACK_DATA:
dab291af8d6307 Mingming Cao               2006-10-11  5258  		if (!jbd2_jou=
rnal_check_available_features
dab291af8d6307 Mingming Cao               2006-10-11  5259  		    (sbi->s_j=
ournal, 0, 0, JBD2_FEATURE_INCOMPAT_REVOKE)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5260  			ext4_msg(sb,=
 KERN_ERR, "Journal does not support "
b31e15527a9bb7 Eric Sandeen               2009-06-04  5261  			       "requ=
ested data journaling mode");
744692dc059845 Jiaying Zhang              2010-03-04  5262  			goto failed_=
mount_wq;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5263  		}
5a150bdec7dc79 Gustavo A. R. Silva        2020-11-20  5264  		break;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5265  	default:
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5266  		break;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5267  	}
ab04df78181b27 Jan Kara                   2016-12-03  5268  =

ab04df78181b27 Jan Kara                   2016-12-03  5269  	if (test_opt(s=
b, DATA_FLAGS) =3D=3D EXT4_MOUNT_ORDERED_DATA &&
ab04df78181b27 Jan Kara                   2016-12-03  5270  	    test_opt(s=
b, JOURNAL_ASYNC_COMMIT)) {
ab04df78181b27 Jan Kara                   2016-12-03  5271  		ext4_msg(sb, =
KERN_ERR, "can't mount with "
ab04df78181b27 Jan Kara                   2016-12-03  5272  			"journal_asy=
nc_commit in data=3Dordered mode");
ab04df78181b27 Jan Kara                   2016-12-03  5273  		goto failed_m=
ount_wq;
ab04df78181b27 Jan Kara                   2016-12-03  5274  	}
ab04df78181b27 Jan Kara                   2016-12-03  5275  =

7edfd85b1ffd36 Lukas Czerner              2021-10-27  5276  	set_task_iopri=
o(sbi->s_journal->j_task, ctx->journal_ioprio);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5277  =

342af94ec6c02a Mauricio Faria de Oliveira 2020-10-05  5278  	sbi->s_journal=
->j_submit_inode_data_buffers =3D
afb585a97f8189 Mauricio Faria de Oliveira 2020-10-05  5279  		ext4_journal_=
submit_inode_data_buffers;
342af94ec6c02a Mauricio Faria de Oliveira 2020-10-05  5280  	sbi->s_journal=
->j_finish_inode_data_buffers =3D
afb585a97f8189 Mauricio Faria de Oliveira 2020-10-05  5281  		ext4_journal_=
finish_inode_data_buffers;
18aadd47f88464 Bobi Jam                   2012-02-20  5282  =

ce7e010aef63dc Theodore Ts'o              2010-11-03  5283  no_journal:
cdb7ee4c632759 Tahsin Erdogan             2017-06-22  5284  	if (!test_opt(=
sb, NO_MBCACHE)) {
47387409ee2e09 Tahsin Erdogan             2017-06-22  5285  		sbi->s_ea_blo=
ck_cache =3D ext4_xattr_create_cache();
47387409ee2e09 Tahsin Erdogan             2017-06-22  5286  		if (!sbi->s_e=
a_block_cache) {
cdb7ee4c632759 Tahsin Erdogan             2017-06-22  5287  			ext4_msg(sb,=
 KERN_ERR,
cdb7ee4c632759 Tahsin Erdogan             2017-06-22  5288  				 "Failed to=
 create ea_block_cache");
9c191f701ce9f9 T Makphaibulchoke          2014-03-18  5289  			goto failed_=
mount_wq;
9c191f701ce9f9 T Makphaibulchoke          2014-03-18  5290  		}
9c191f701ce9f9 T Makphaibulchoke          2014-03-18  5291  =

dec214d00e0d78 Tahsin Erdogan             2017-06-22  5292  		if (ext4_has_=
feature_ea_inode(sb)) {
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5293  			sbi->s_ea_in=
ode_cache =3D ext4_xattr_create_cache();
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5294  			if (!sbi->s_=
ea_inode_cache) {
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5295  				ext4_msg(sb=
, KERN_ERR,
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5296  					 "Failed t=
o create ea_inode_cache");
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5297  				goto failed=
_mount_wq;
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5298  			}
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5299  		}
cdb7ee4c632759 Tahsin Erdogan             2017-06-22  5300  	}
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5301  =

c93d8f88580921 Eric Biggers               2019-07-22  5302  	if (ext4_has_f=
eature_verity(sb) && blocksize !=3D PAGE_SIZE) {
c93d8f88580921 Eric Biggers               2019-07-22  5303  		ext4_msg(sb, =
KERN_ERR, "Unsupported blocksize for fs-verity");
c93d8f88580921 Eric Biggers               2019-07-22  5304  		goto failed_m=
ount_wq;
c93d8f88580921 Eric Biggers               2019-07-22  5305  	}
c93d8f88580921 Eric Biggers               2019-07-22  5306  =

bc98a42c1f7d0f David Howells              2017-07-17  5307  	if (DUMMY_ENCR=
YPTION_ENABLED(sbi) && !sb_rdonly(sb) &&
e2b911c53584a9 Darrick J. Wong            2015-10-17  5308  	    !ext4_has_=
feature_encrypt(sb)) {
e2b911c53584a9 Darrick J. Wong            2015-10-17  5309  		ext4_set_feat=
ure_encrypt(sb);
4392fbc4bab57d Jan Kara                   2020-12-16  5310  		ext4_commit_s=
uper(sb);
6ddb2447846a8e Theodore Ts'o              2015-04-16  5311  	}
6ddb2447846a8e Theodore Ts'o              2015-04-16  5312  =

952fc18ef9ec70 Theodore Ts'o              2012-07-09  5313  	/*
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5314  	 * Get the # o=
f file system overhead blocks from the
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5315  	 * superblock =
if present.
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5316  	 */
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5317  	if (es->s_over=
head_clusters)
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5318  		sbi->s_overhe=
ad =3D le32_to_cpu(es->s_overhead_clusters);
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5319  	else {
07aa2ea13814ea Lukas Czerner              2012-11-08  5320  		err =3D ext4_=
calculate_overhead(sb);
07aa2ea13814ea Lukas Czerner              2012-11-08  5321  		if (err)
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5322  			goto failed_=
mount_wq;
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5323  	}
952fc18ef9ec70 Theodore Ts'o              2012-07-09  5324  =

fd89d5f2030ac8 Tejun Heo                  2011-02-01  5325  	/*
fd89d5f2030ac8 Tejun Heo                  2011-02-01  5326  	 * The maximum=
 number of concurrent works can be high and
fd89d5f2030ac8 Tejun Heo                  2011-02-01  5327  	 * concurrency=
 isn't really necessary.  Limit it to 1.
fd89d5f2030ac8 Tejun Heo                  2011-02-01  5328  	 */
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5329  	EXT4_SB(sb)->r=
sv_conversion_wq =3D
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5330  		alloc_workque=
ue("ext4-rsv-conversion", WQ_MEM_RECLAIM | WQ_UNBOUND, 1);
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5331  	if (!EXT4_SB(s=
b)->rsv_conversion_wq) {
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5332  		printk(KERN_E=
RR "EXT4-fs: failed to create workqueue\n");
07aa2ea13814ea Lukas Czerner              2012-11-08  5333  		ret =3D -ENOM=
EM;
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5334  		goto failed_m=
ount4;
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5335  	}
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5336  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5337  	/*
dab291af8d6307 Mingming Cao               2006-10-11  5338  	 * The jbd2_jo=
urnal_load will have done any necessary log recovery,
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5339  	 * so we can s=
afely mount the rest of the filesystem now.
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5340  	 */
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5341  =

8a363970d1dc38 Theodore Ts'o              2018-12-19  5342  	root =3D ext4_=
iget(sb, EXT4_ROOT_INO, EXT4_IGET_SPECIAL);
1d1fe1ee02b9ac David Howells              2008-02-07  5343  	if (IS_ERR(roo=
t)) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5344  		ext4_msg(sb, =
KERN_ERR, "get root inode failed");
1d1fe1ee02b9ac David Howells              2008-02-07  5345  		ret =3D PTR_E=
RR(root);
32a9bb57d7c1fd Manish Katiyar             2011-02-27  5346  		root =3D NULL;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5347  		goto failed_m=
ount4;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5348  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5349  	if (!S_ISDIR(r=
oot->i_mode) || !root->i_blocks || !root->i_size) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5350  		ext4_msg(sb, =
KERN_ERR, "corrupt root inode, run e2fsck");
94bf608a18fa44 Al Viro                    2012-01-09  5351  		iput(root);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5352  		goto failed_m=
ount4;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5353  	}
b886ee3e778ec2 Gabriel Krisman Bertazi    2019-04-25  5354  =

48fde701aff662 Al Viro                    2012-01-08  5355  	sb->s_root =3D=
 d_make_root(root);
1d1fe1ee02b9ac David Howells              2008-02-07  5356  	if (!sb->s_roo=
t) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5357  		ext4_msg(sb, =
KERN_ERR, "get root dentry failed");
1d1fe1ee02b9ac David Howells              2008-02-07  5358  		ret =3D -ENOM=
EM;
1d1fe1ee02b9ac David Howells              2008-02-07  5359  		goto failed_m=
ount4;
1d1fe1ee02b9ac David Howells              2008-02-07  5360  	}
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5361  =

c89128a0083814 Jaegeuk Kim                2018-05-13  5362  	ret =3D ext4_s=
etup_super(sb, es, sb_rdonly(sb));
c89128a0083814 Jaegeuk Kim                2018-05-13  5363  	if (ret =3D=3D=
 -EROFS) {
1751e8a6cb935e Linus Torvalds             2017-11-27  5364  		sb->s_flags |=
=3D SB_RDONLY;
c89128a0083814 Jaegeuk Kim                2018-05-13  5365  		ret =3D 0;
c89128a0083814 Jaegeuk Kim                2018-05-13  5366  	} else if (ret)
c89128a0083814 Jaegeuk Kim                2018-05-13  5367  		goto failed_m=
ount4a;
ef7f38359ea8b3 Kalpak Shah                2007-07-18  5368  =

b5799018827e67 Theodore Ts'o              2015-09-23  5369  	ext4_set_resv_=
clusters(sb);
27dd43854227bb Lukas Czerner              2013-04-09  5370  =

0f5bde1db174f6 Jan Kara                   2020-07-28  5371  	if (test_opt(s=
b, BLOCK_VALIDITY)) {
6fd058f7791087 Theodore Ts'o              2009-05-17  5372  		err =3D ext4_=
setup_system_zone(sb);
6fd058f7791087 Theodore Ts'o              2009-05-17  5373  		if (err) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5374  			ext4_msg(sb,=
 KERN_ERR, "failed to initialize system "
fbe845ddf368f7 Curt Wohlgemuth            2010-05-16  5375  				 "zone (%d)=
", err);
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5376  			goto failed_=
mount4a;
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5377  		}
0f5bde1db174f6 Jan Kara                   2020-07-28  5378  	}
8016e29f4362e2 Harshad Shirwadkar         2020-10-15  5379  	ext4_fc_replay=
_cleanup(sb);
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5380  =

f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5381  	ext4_ext_init(=
sb);
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5382  =

196e402adf2e4c Harshad Shirwadkar         2021-04-01  5383  	/*
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5384  	 * Enable opti=
mize_scan if number of groups is > threshold. This can be
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5385  	 * turned off =
by passing "mb_optimize_scan=3D0". This can also be
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5386  	 * turned on f=
orcefully by passing "mb_optimize_scan=3D1".
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5387  	 */
7edfd85b1ffd36 Lukas Czerner              2021-10-27  5388  	if (ctx->mb_op=
timize_scan =3D=3D 1)
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5389  		set_opt2(sb, =
MB_OPTIMIZE_SCAN);
7edfd85b1ffd36 Lukas Czerner              2021-10-27  5390  	else if (ctx->=
mb_optimize_scan =3D=3D 0)
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5391  		clear_opt2(sb=
, MB_OPTIMIZE_SCAN);
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5392  	else if (sbi->=
s_groups_count >=3D MB_DEFAULT_LINEAR_SCAN_THRESHOLD)
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5393  		set_opt2(sb, =
MB_OPTIMIZE_SCAN);
196e402adf2e4c Harshad Shirwadkar         2021-04-01  5394  =

f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5395  	err =3D ext4_m=
b_init(sb);
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5396  	if (err) {
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5397  		ext4_msg(sb, =
KERN_ERR, "failed to initialize mballoc (%d)",
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5398  			 err);
dcf2d804ed6ffe Tao Ma                     2011-10-06  5399  		goto failed_m=
ount5;
c2774d84fd6cab Aneesh Kumar K.V           2008-10-10  5400  	}
c2774d84fd6cab Aneesh Kumar K.V           2008-10-10  5401  =

027f14f5357279 Theodore Ts'o              2021-01-21  5402  	/*
027f14f5357279 Theodore Ts'o              2021-01-21  5403  	 * We can only=
 set up the journal commit callback once
027f14f5357279 Theodore Ts'o              2021-01-21  5404  	 * mballoc is =
initialized
027f14f5357279 Theodore Ts'o              2021-01-21  5405  	 */
027f14f5357279 Theodore Ts'o              2021-01-21  5406  	if (sbi->s_jou=
rnal)
027f14f5357279 Theodore Ts'o              2021-01-21  5407  		sbi->s_journa=
l->j_commit_callback =3D
027f14f5357279 Theodore Ts'o              2021-01-21  5408  			ext4_journal=
_commit_callback;
027f14f5357279 Theodore Ts'o              2021-01-21  5409  =

d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5410  	block =3D ext4=
_count_free_clusters(sb);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5411  	ext4_free_bloc=
ks_count_set(sbi->s_es,
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5412  				   EXT4_C2B=
(sbi, block));
908c7f1949cb7c Tejun Heo                  2014-09-08  5413  	err =3D percpu=
_counter_init(&sbi->s_freeclusters_counter, block,
908c7f1949cb7c Tejun Heo                  2014-09-08  5414  				  GFP_KERNE=
L);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5415  	if (!err) {
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5416  		unsigned long=
 freei =3D ext4_count_free_inodes(sb);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5417  		sbi->s_es->s_=
free_inodes_count =3D cpu_to_le32(freei);
908c7f1949cb7c Tejun Heo                  2014-09-08  5418  		err =3D percp=
u_counter_init(&sbi->s_freeinodes_counter, freei,
908c7f1949cb7c Tejun Heo                  2014-09-08  5419  					  GFP_KERN=
EL);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5420  	}
b2bbb92f7042e8 Jan Kara                   2021-08-12  5421  	/*
b2bbb92f7042e8 Jan Kara                   2021-08-12  5422  	 * Update the =
checksum after updating free space/inode
b2bbb92f7042e8 Jan Kara                   2021-08-12  5423  	 * counters.  =
Otherwise the superblock can have an incorrect
b2bbb92f7042e8 Jan Kara                   2021-08-12  5424  	 * checksum in=
 the buffer cache until it is written out and
b2bbb92f7042e8 Jan Kara                   2021-08-12  5425  	 * e2fsprogs p=
rograms trying to open a file system immediately
b2bbb92f7042e8 Jan Kara                   2021-08-12  5426  	 * after it is=
 mounted can fail.
b2bbb92f7042e8 Jan Kara                   2021-08-12  5427  	 */
b2bbb92f7042e8 Jan Kara                   2021-08-12  5428  	ext4_superbloc=
k_csum_set(sb);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5429  	if (!err)
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5430  		err =3D percp=
u_counter_init(&sbi->s_dirs_counter,
908c7f1949cb7c Tejun Heo                  2014-09-08  5431  					  ext4_cou=
nt_dirs(sb), GFP_KERNEL);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5432  	if (!err)
908c7f1949cb7c Tejun Heo                  2014-09-08  5433  		err =3D percp=
u_counter_init(&sbi->s_dirtyclusters_counter, 0,
908c7f1949cb7c Tejun Heo                  2014-09-08  5434  					  GFP_KERN=
EL);
efc61345274d6c Eric Whitney               2021-02-18  5435  	if (!err)
efc61345274d6c Eric Whitney               2021-02-18  5436  		err =3D percp=
u_counter_init(&sbi->s_sra_exceeded_retry_limit, 0,
efc61345274d6c Eric Whitney               2021-02-18  5437  					  GFP_KERN=
EL);
c8585c6fcaf201 Daeho Jeong                2016-04-25  5438  	if (!err)
bbd55937de8f27 Eric Biggers               2020-02-19  5439  		err =3D percp=
u_init_rwsem(&sbi->s_writepages_rwsem);
c8585c6fcaf201 Daeho Jeong                2016-04-25  5440  =

d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5441  	if (err) {
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5442  		ext4_msg(sb, =
KERN_ERR, "insufficient memory");
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5443  		goto failed_m=
ount6;
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5444  	}
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5445  =

e2b911c53584a9 Darrick J. Wong            2015-10-17  5446  	if (ext4_has_f=
eature_flex_bg(sb))
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5447  		if (!ext4_fil=
l_flex_info(sb)) {
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5448  			ext4_msg(sb,=
 KERN_ERR,
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5449  			       "unab=
le to initialize "
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5450  			       "flex=
_bg meta info!");
8f6840c4fd1e7b Yang Yingliang             2021-05-10  5451  			ret =3D -ENO=
MEM;
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5452  			goto failed_=
mount6;
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5453  		}
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5454  =

bfff68738f1cb5 Lukas Czerner              2010-10-27  5455  	err =3D ext4_r=
egister_li_request(sb, first_not_zeroed);
bfff68738f1cb5 Lukas Czerner              2010-10-27  5456  	if (err)
dcf2d804ed6ffe Tao Ma                     2011-10-06  5457  		goto failed_m=
ount6;
bfff68738f1cb5 Lukas Czerner              2010-10-27  5458  =

b5799018827e67 Theodore Ts'o              2015-09-23  5459  	err =3D ext4_r=
egister_sysfs(sb);
dcf2d804ed6ffe Tao Ma                     2011-10-06  5460  	if (err)
dcf2d804ed6ffe Tao Ma                     2011-10-06  5461  		goto failed_m=
ount7;
3197ebdb130473 Theodore Ts'o              2009-03-31  5462  =

02f310fcf47fa9 Jan Kara                   2021-08-16  5463  	err =3D ext4_i=
nit_orphan_info(sb);
02f310fcf47fa9 Jan Kara                   2021-08-16  5464  	if (err)
02f310fcf47fa9 Jan Kara                   2021-08-16  5465  		goto failed_m=
ount8;
9b2ff35753c051 Jan Kara                   2013-03-02  5466  #ifdef CONFIG_Q=
UOTA
9b2ff35753c051 Jan Kara                   2013-03-02  5467  	/* Enable quot=
a usage during mount. */
bc98a42c1f7d0f David Howells              2017-07-17  5468  	if (ext4_has_f=
eature_quota(sb) && !sb_rdonly(sb)) {
9b2ff35753c051 Jan Kara                   2013-03-02  5469  		err =3D ext4_=
enable_quotas(sb);
9b2ff35753c051 Jan Kara                   2013-03-02  5470  		if (err)
02f310fcf47fa9 Jan Kara                   2021-08-16  5471  			goto failed_=
mount9;
9b2ff35753c051 Jan Kara                   2013-03-02  5472  	}
9b2ff35753c051 Jan Kara                   2013-03-02  5473  #endif  /* CONF=
IG_QUOTA */
9b2ff35753c051 Jan Kara                   2013-03-02  5474  =

bc71726c725767 zhangyi (F                 2020-06-20  5475) 	/*
bc71726c725767 zhangyi (F                 2020-06-20  5476) 	 * Save the or=
iginal bdev mapping's wb_err value which could be
bc71726c725767 zhangyi (F                 2020-06-20  5477) 	 * used to det=
ect the metadata async write error.
bc71726c725767 zhangyi (F                 2020-06-20  5478) 	 */
bc71726c725767 zhangyi (F                 2020-06-20  5479) 	spin_lock_init=
(&sbi->s_bdev_wb_lock);
bc71726c725767 zhangyi (F                 2020-06-20  5480) 	errseq_check_a=
nd_advance(&sb->s_bdev->bd_inode->i_mapping->wb_err,
bc71726c725767 zhangyi (F                 2020-06-20  5481) 				 &sbi->s_bd=
ev_wb_err);
bc71726c725767 zhangyi (F                 2020-06-20  5482) 	sb->s_bdev->bd=
_super =3D sb;
617ba13b31fbf5 Mingming Cao               2006-10-11  5483  	EXT4_SB(sb)->s=
_mount_state |=3D EXT4_ORPHAN_FS;
617ba13b31fbf5 Mingming Cao               2006-10-11  5484  	ext4_orphan_cl=
eanup(sb, es);
617ba13b31fbf5 Mingming Cao               2006-10-11  5485  	EXT4_SB(sb)->s=
_mount_state &=3D ~EXT4_ORPHAN_FS;
0390131ba84fd3 Frank Mayhar               2009-01-07  5486  	if (needs_reco=
very) {
b31e15527a9bb7 Eric Sandeen               2009-06-04  5487  		ext4_msg(sb, =
KERN_INFO, "recovery complete");
11215630aada28 Jan Kara                   2020-07-10  5488  		err =3D ext4_=
mark_recovery_complete(sb, es);
11215630aada28 Jan Kara                   2020-07-10  5489  		if (err)
02f310fcf47fa9 Jan Kara                   2021-08-16  5490  			goto failed_=
mount9;
0390131ba84fd3 Frank Mayhar               2009-01-07  5491  	}
0390131ba84fd3 Frank Mayhar               2009-01-07  5492  =

79add3a3f795e6 Lukas Czerner              2012-11-08  5493  	if (test_opt(s=
b, DISCARD)) {
79add3a3f795e6 Lukas Czerner              2012-11-08  5494  		struct reques=
t_queue *q =3D bdev_get_queue(sb->s_bdev);
79add3a3f795e6 Lukas Czerner              2012-11-08  5495  		if (!blk_queu=
e_discard(q))
79add3a3f795e6 Lukas Czerner              2012-11-08  5496  			ext4_msg(sb,=
 KERN_WARNING,
79add3a3f795e6 Lukas Czerner              2012-11-08  5497  				 "mounting =
with \"discard\" option, but "
79add3a3f795e6 Lukas Czerner              2012-11-08  5498  				 "the devic=
e does not support discard");
79add3a3f795e6 Lukas Czerner              2012-11-08  5499  	}
79add3a3f795e6 Lukas Czerner              2012-11-08  5500  =

66e61a9e9504f6 Theodore Ts'o              2010-07-27  5501  	if (es->s_erro=
r_count)
66e61a9e9504f6 Theodore Ts'o              2010-07-27  5502  		mod_timer(&sb=
i->s_err_report, jiffies + 300*HZ); /* 5 minutes */
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5503  =

efbed4dc5857f8 Theodore Ts'o              2013-10-17  5504  	/* Enable mess=
age ratelimiting. Default is 10 messages per 5 secs. */
efbed4dc5857f8 Theodore Ts'o              2013-10-17  5505  	ratelimit_stat=
e_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f8 Theodore Ts'o              2013-10-17  5506  	ratelimit_stat=
e_init(&sbi->s_warning_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f8 Theodore Ts'o              2013-10-17  5507  	ratelimit_stat=
e_init(&sbi->s_msg_ratelimit_state, 5 * HZ, 10);
1cf006ed19a887 Dmitry Monakhov            2020-07-25  5508  	atomic_set(&sb=
i->s_warning_count, 0);
1cf006ed19a887 Dmitry Monakhov            2020-07-25  5509  	atomic_set(&sb=
i->s_msg_count, 0);
efbed4dc5857f8 Theodore Ts'o              2013-10-17  5510  =

ac27a0ec112a08 Dave Kleikamp              2006-10-11  5511  	return 0;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5512  =

617ba13b31fbf5 Mingming Cao               2006-10-11  5513  cantfind_ext4:
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5514  	if (!silent)
b31e15527a9bb7 Eric Sandeen               2009-06-04  5515  		ext4_msg(sb, =
KERN_ERR, "VFS: Can't find ext4 filesystem");
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5516  	goto failed_mo=
unt;
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5517  =

02f310fcf47fa9 Jan Kara                   2021-08-16  5518  failed_mount9:
02f310fcf47fa9 Jan Kara                   2021-08-16  5519  	ext4_release_o=
rphan_info(sb);
72ba74508b2857 Theodore Ts'o              2013-01-24  5520  failed_mount8:
ebd173beb8db5b Theodore Ts'o              2015-09-23  5521  	ext4_unregiste=
r_sysfs(sb);
cb8d53d2c97369 Eric Biggers               2020-09-22  5522  	kobject_put(&s=
bi->s_kobj);
dcf2d804ed6ffe Tao Ma                     2011-10-06  5523  failed_mount7:
dcf2d804ed6ffe Tao Ma                     2011-10-06  5524  	ext4_unregiste=
r_li_request(sb);
dcf2d804ed6ffe Tao Ma                     2011-10-06  5525  failed_mount6:
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5526  	ext4_mb_releas=
e(sb);
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5527  	rcu_read_lock(=
);
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5528  	flex_groups =
=3D rcu_dereference(sbi->s_flex_groups);
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5529  	if (flex_group=
s) {
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5530  		for (i =3D 0;=
 i < sbi->s_flex_groups_allocated; i++)
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5531  			kvfree(flex_=
groups[i]);
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5532  		kvfree(flex_g=
roups);
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5533  	}
7c990728b99ed6 Suraj Jitindar Singh       2020-02-18  5534  	rcu_read_unloc=
k();
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5535  	percpu_counter=
_destroy(&sbi->s_freeclusters_counter);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5536  	percpu_counter=
_destroy(&sbi->s_freeinodes_counter);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5537  	percpu_counter=
_destroy(&sbi->s_dirs_counter);
d5e03cbb0c88cd Theodore Ts'o              2014-07-15  5538  	percpu_counter=
_destroy(&sbi->s_dirtyclusters_counter);
efc61345274d6c Eric Whitney               2021-02-18  5539  	percpu_counter=
_destroy(&sbi->s_sra_exceeded_retry_limit);
bbd55937de8f27 Eric Biggers               2020-02-19  5540  	percpu_free_rw=
sem(&sbi->s_writepages_rwsem);
007649375f6af2 Azat Khuzhin               2014-04-07  5541  failed_mount5:
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5542  	ext4_ext_relea=
se(sb);
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5543  	ext4_release_s=
ystem_zone(sb);
f9ae9cf5d72b39 Theodore Ts'o              2014-07-11  5544  failed_mount4a:
94bf608a18fa44 Al Viro                    2012-01-09  5545  	dput(sb->s_roo=
t);
32a9bb57d7c1fd Manish Katiyar             2011-02-27  5546  	sb->s_root =3D=
 NULL;
94bf608a18fa44 Al Viro                    2012-01-09  5547  failed_mount4:
b31e15527a9bb7 Eric Sandeen               2009-06-04  5548  	ext4_msg(sb, K=
ERN_ERR, "mount failed");
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5549  	if (EXT4_SB(sb=
)->rsv_conversion_wq)
2e8fa54e3b48e4 Jan Kara                   2013-06-04  5550  		destroy_workq=
ueue(EXT4_SB(sb)->rsv_conversion_wq);
4c0425ff68b1b8 Mingming Cao               2009-09-28  5551  failed_mount_wq:
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5552  	ext4_xattr_des=
troy_cache(sbi->s_ea_inode_cache);
dec214d00e0d78 Tahsin Erdogan             2017-06-22  5553  	sbi->s_ea_inod=
e_cache =3D NULL;
50c15df69e062b Chengguang Xu              2018-12-04  5554  =

47387409ee2e09 Tahsin Erdogan             2017-06-22  5555  	ext4_xattr_des=
troy_cache(sbi->s_ea_block_cache);
47387409ee2e09 Tahsin Erdogan             2017-06-22  5556  	sbi->s_ea_bloc=
k_cache =3D NULL;
50c15df69e062b Chengguang Xu              2018-12-04  5557  =

0390131ba84fd3 Frank Mayhar               2009-01-07  5558  	if (sbi->s_jou=
rnal) {
bb9464e08309f6 yangerkun                  2021-09-24  5559  		/* flush s_er=
ror_work before journal destroy. */
bb9464e08309f6 yangerkun                  2021-09-24  5560  		flush_work(&s=
bi->s_error_work);
dab291af8d6307 Mingming Cao               2006-10-11  5561  		jbd2_journal_=
destroy(sbi->s_journal);
47b4a50bebfd34 Jan Kara                   2008-07-11  5562  		sbi->s_journa=
l =3D NULL;
0390131ba84fd3 Frank Mayhar               2009-01-07  5563  	}
50460fe8c6d1d9 Darrick J. Wong            2014-10-30  5564  failed_mount3a:
d3922a777f9b4c Zheng Liu                  2013-07-01  5565  	ext4_es_unregi=
ster_shrinker(sbi);
eb68d0e2fc5a4e Zheng Liu                  2014-09-01  5566  failed_mount3:
bb9464e08309f6 yangerkun                  2021-09-24  5567  	/* flush s_err=
or_work before sbi destroy */
c92dc856848f32 Jan Kara                   2020-11-27  5568  	flush_work(&sb=
i->s_error_work);
2a4ae3bcdf05b8 Jan Kara                   2021-03-15  5569  	del_timer_sync=
(&sbi->s_err_report);
618f003199c618 Pavel Skripkin             2021-04-30  5570  	ext4_stop_mmpd=
(sbi);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5571  failed_mount2:
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5572  	rcu_read_lock(=
);
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5573  	group_desc =3D=
 rcu_dereference(sbi->s_group_desc);
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5574  	for (i =3D 0; =
i < db_count; i++)
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5575  		brelse(group_=
desc[i]);
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5576  	kvfree(group_d=
esc);
1d0c3924a92e69 Theodore Ts'o              2020-02-15  5577  	rcu_read_unloc=
k();
ac27a0ec112a08 Dave Kleikamp              2006-10-11  5578  failed_mount:
0441984a339897 Darrick J. Wong            2012-04-29  5579  	if (sbi->s_chk=
sum_driver)
0441984a339897 Darrick J. Wong            2012-04-29  5580  		crypto_free_s=
hash(sbi->s_chksum_driver);
c83ad55eaa91c8 Gabriel Krisman Bertazi    2019-04-25  5581  =


:::::: The code at line 4826 was first introduced by commit
:::::: fc626fe322f13ecdfac58cbfa6cfea797ed22623 fs/ext4: Change EXT4_MOUNT_=
DAX to EXT4_MOUNT_DAX_ALWAYS

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2446923547109319623==--

