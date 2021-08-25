Content-Type: multipart/mixed; boundary="===============1146001107552109963=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8625/10077] fs/erofs/inode.c:210 erofs_read_inode() error: double free of 'copied'
Date: Wed, 25 Aug 2021 10:26:42 +0800
Message-ID: <202108251030.bELQozR7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1146001107552109963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Liu Bo <bo.liu@linux.alibaba.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   372b2891c15acbf7b90d948b08ac174bde77102c
commit: c5aa903a59db274554718cddfda9039913409ec9 [8625/10077] erofs: suppor=
t reading chunk-based uncompressed files
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-m031-20210824 (attached as .config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/erofs/inode.c:210 erofs_read_inode() error: double free of 'copied'

Old smatch warnings:
fs/erofs/inode.c:201 erofs_read_inode() warn: should 'nblks << (13 - 9)' be=
 a 64 bit type?

vim +/copied +210 fs/erofs/inode.c

13f06f48f7bf8eb drivers/staging/erofs/inode.c Chao Yu   2018-07-26   10  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   11  /*
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   12   *=
 if inode is successfully read, return its inode page (or sometimes
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   13   *=
 the inode payload page if it's an extended inode) in order to fill
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   14   *=
 inline data if possible.
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   15   */
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   16  st=
atic struct page *erofs_read_inode(struct inode *inode,
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   17  		=
		     unsigned int *ofs)
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26   18  {
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   19  	s=
truct super_block *sb =3D inode->i_sb;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   20  	s=
truct erofs_sb_info *sbi =3D EROFS_SB(sb);
a5876e24f13f134 fs/erofs/inode.c              Gao Xiang 2019-09-04   21  	s=
truct erofs_inode *vi =3D EROFS_I(inode);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   22  	c=
onst erofs_off_t inode_loc =3D iloc(sbi, vi->nid);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   23  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   24  	e=
rofs_blk_t blkaddr, nblks =3D 0;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   25  	s=
truct page *page;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   26  	s=
truct erofs_inode_compact *dic;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   27  	s=
truct erofs_inode_extended *die, *copied =3D NULL;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   28  	u=
nsigned int ifmt;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   29  	i=
nt err;
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26   30  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   31  	b=
lkaddr =3D erofs_blknr(inode_loc);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   32  	*=
ofs =3D erofs_blkoff(inode_loc);
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26   33  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   34  	e=
rofs_dbg("%s, reading inode nid %llu at %u of blkaddr %u",
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   35  		=
  __func__, vi->nid, *ofs, blkaddr);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   36  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   37  	p=
age =3D erofs_get_meta_page(sb, blkaddr);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   38  	i=
f (IS_ERR(page)) {
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   39  		=
erofs_err(sb, "failed to get inode (nid: %llu) page, err %ld",
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   40  		=
	  vi->nid, PTR_ERR(page));
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   41  		=
return page;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   42  	}
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   43  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   44  	d=
ic =3D page_address(page) + *ofs;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   45  	i=
fmt =3D le16_to_cpu(dic->i_format);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   46  =

24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   47  	i=
f (ifmt & ~EROFS_I_ALL) {
24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   48  		=
erofs_err(inode->i_sb, "unsupported i_format %u of nid %llu",
24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   49  		=
	  ifmt, vi->nid);
24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   50  		=
err =3D -EOPNOTSUPP;
24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   51  		=
goto err_out;
24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   52  	}
24a806d849c0b0c fs/erofs/inode.c              Gao Xiang 2021-03-29   53  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   54  	v=
i->datalayout =3D erofs_inode_datalayout(ifmt);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   55  	i=
f (vi->datalayout >=3D EROFS_INODE_DATALAYOUT_MAX) {
4f761fa253b49f6 fs/erofs/inode.c              Gao Xiang 2019-09-04   56  		=
erofs_err(inode->i_sb, "unsupported datalayout %u of nid %llu",
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   57  		=
	  vi->datalayout, vi->nid);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   58  		=
err =3D -EOPNOTSUPP;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   59  		=
goto err_out;
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26   60  	}
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26   61  =

8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   62  	s=
witch (erofs_inode_version(ifmt)) {
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   63  	c=
ase EROFS_INODE_LAYOUT_EXTENDED:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   64  		=
vi->inode_isize =3D sizeof(struct erofs_inode_extended);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   65  		=
/* check if the inode acrosses page boundary */
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   66  		=
if (*ofs + vi->inode_isize <=3D PAGE_SIZE) {
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   67  		=
	*ofs +=3D vi->inode_isize;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   68  		=
	die =3D (struct erofs_inode_extended *)dic;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   69  		=
} else {
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   70  		=
	const unsigned int gotten =3D PAGE_SIZE - *ofs;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   71  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   72  		=
	copied =3D kmalloc(vi->inode_isize, GFP_NOFS);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   73  		=
	if (!copied) {
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   74  		=
		err =3D -ENOMEM;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   75  		=
		goto err_out;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   76  		=
	}
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   77  		=
	memcpy(copied, dic, gotten);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   78  		=
	unlock_page(page);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   79  		=
	put_page(page);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   80  =

0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   81  		=
	page =3D erofs_get_meta_page(sb, blkaddr + 1);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   82  		=
	if (IS_ERR(page)) {
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   83  		=
		erofs_err(sb, "failed to get inode payload page (nid: %llu), err %ld",
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   84  		=
			  vi->nid, PTR_ERR(page));
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   85  		=
		kfree(copied);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   86  		=
		return page;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   87  		=
	}
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   88  		=
	*ofs =3D vi->inode_isize - gotten;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   89  		=
	memcpy((u8 *)copied + gotten, page_address(page), *ofs);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   90  		=
	die =3D copied;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30   91  		}
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   92  		=
vi->xattr_isize =3D erofs_xattr_ibody_size(die->i_xattr_icount);
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26   93  =

8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   94  		=
inode->i_mode =3D le16_to_cpu(die->i_mode);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   95  		=
switch (inode->i_mode & S_IFMT) {
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   96  		=
case S_IFREG:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   97  		=
case S_IFDIR:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   98  		=
case S_IFLNK:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04   99  		=
	vi->raw_blkaddr =3D le32_to_cpu(die->i_u.raw_blkaddr);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  100  		=
	break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  101  		=
case S_IFCHR:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  102  		=
case S_IFBLK:
d5beb31b6b1c0a3 drivers/staging/erofs/inode.c Chao Yu   2018-07-26  103  		=
	inode->i_rdev =3D
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  104  		=
		new_decode_dev(le32_to_cpu(die->i_u.rdev));
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  105  		=
	break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  106  		=
case S_IFIFO:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  107  		=
case S_IFSOCK:
d5beb31b6b1c0a3 drivers/staging/erofs/inode.c Chao Yu   2018-07-26  108  		=
	inode->i_rdev =3D 0;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  109  		=
	break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  110  		=
default:
a6b9b1d5eae61a6 drivers/staging/erofs/inode.c Gao Xiang 2019-08-14  111  		=
	goto bogusimode;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  112  		}
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  113  		=
i_uid_write(inode, le32_to_cpu(die->i_uid));
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  114  		=
i_gid_write(inode, le32_to_cpu(die->i_gid));
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  115  		=
set_nlink(inode, le32_to_cpu(die->i_nlink));
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  116  =

d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  117  		=
/* extended inode has its own timestamp */
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  118  		=
inode->i_ctime.tv_sec =3D le64_to_cpu(die->i_ctime);
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  119  		=
inode->i_ctime.tv_nsec =3D le32_to_cpu(die->i_ctime_nsec);
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  120  =

8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  121  		=
inode->i_size =3D le64_to_cpu(die->i_size);
fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  122  =

fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  123  		=
/* total blocks for compressed files */
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  124  		=
if (erofs_inode_is_data_compressed(vi->datalayout))
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  125  		=
	nblks =3D le32_to_cpu(die->i_u.compressed_blocks);
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  126  		=
else if (vi->datalayout =3D=3D EROFS_INODE_CHUNK_BASED)
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  127  		=
	/* fill chunked inode summary info */
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  128  		=
	vi->chunkformat =3D le16_to_cpu(die->i_u.c.format);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  129  		=
kfree(copied);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  130  		=
break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  131  	c=
ase EROFS_INODE_LAYOUT_COMPACT:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  132  		=
vi->inode_isize =3D sizeof(struct erofs_inode_compact);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  133  		=
*ofs +=3D vi->inode_isize;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  134  		=
vi->xattr_isize =3D erofs_xattr_ibody_size(dic->i_xattr_icount);
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  135  =

8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  136  		=
inode->i_mode =3D le16_to_cpu(dic->i_mode);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  137  		=
switch (inode->i_mode & S_IFMT) {
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  138  		=
case S_IFREG:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  139  		=
case S_IFDIR:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  140  		=
case S_IFLNK:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  141  		=
	vi->raw_blkaddr =3D le32_to_cpu(dic->i_u.raw_blkaddr);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  142  		=
	break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  143  		=
case S_IFCHR:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  144  		=
case S_IFBLK:
d5beb31b6b1c0a3 drivers/staging/erofs/inode.c Chao Yu   2018-07-26  145  		=
	inode->i_rdev =3D
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  146  		=
		new_decode_dev(le32_to_cpu(dic->i_u.rdev));
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  147  		=
	break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  148  		=
case S_IFIFO:
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  149  		=
case S_IFSOCK:
d5beb31b6b1c0a3 drivers/staging/erofs/inode.c Chao Yu   2018-07-26  150  		=
	inode->i_rdev =3D 0;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  151  		=
	break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  152  		=
default:
a6b9b1d5eae61a6 drivers/staging/erofs/inode.c Gao Xiang 2019-08-14  153  		=
	goto bogusimode;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  154  		}
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  155  		=
i_uid_write(inode, le16_to_cpu(dic->i_uid));
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  156  		=
i_gid_write(inode, le16_to_cpu(dic->i_gid));
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  157  		=
set_nlink(inode, le16_to_cpu(dic->i_nlink));
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  158  =

d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  159  		=
/* use build time for compact inodes */
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  160  		=
inode->i_ctime.tv_sec =3D sbi->build_time;
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  161  		=
inode->i_ctime.tv_nsec =3D sbi->build_time_nsec;
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  162  =

8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  163  		=
inode->i_size =3D le32_to_cpu(dic->i_size);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  164  		=
if (erofs_inode_is_data_compressed(vi->datalayout))
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  165  		=
	nblks =3D le32_to_cpu(dic->i_u.compressed_blocks);
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  166  		=
else if (vi->datalayout =3D=3D EROFS_INODE_CHUNK_BASED)
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  167  		=
	vi->chunkformat =3D le16_to_cpu(dic->i_u.c.format);
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  168  		=
break;
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  169  	d=
efault:
4f761fa253b49f6 fs/erofs/inode.c              Gao Xiang 2019-09-04  170  		=
erofs_err(inode->i_sb,
4f761fa253b49f6 fs/erofs/inode.c              Gao Xiang 2019-09-04  171  		=
	  "unsupported on-disk inode version %u of nid %llu",
8a76568225deae1 fs/erofs/inode.c              Gao Xiang 2019-09-04  172  		=
	  erofs_inode_version(ifmt), vi->nid);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  173  		=
err =3D -EOPNOTSUPP;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  174  		=
goto err_out;
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  175  	}
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  176  =

c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  177  	i=
f (vi->datalayout =3D=3D EROFS_INODE_CHUNK_BASED) {
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  178  		=
if (!(vi->chunkformat & EROFS_CHUNK_FORMAT_ALL)) {
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  179  		=
	erofs_err(inode->i_sb,
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  180  		=
		  "unsupported chunk format %x of nid %llu",
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  181  		=
		  vi->chunkformat, vi->nid);
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  182  		=
	err =3D -EOPNOTSUPP;
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  183  		=
	goto err_out;
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  184  		}
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  185  		=
vi->chunkbits =3D LOG_BLOCK_SIZE +
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  186  		=
	(vi->chunkformat & EROFS_CHUNK_FORMAT_BLKBITS_MASK);
c5aa903a59db274 fs/erofs/inode.c              Gao Xiang 2021-08-20  187  	}
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  188  	i=
node->i_mtime.tv_sec =3D inode->i_ctime.tv_sec;
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  189  	i=
node->i_atime.tv_sec =3D inode->i_ctime.tv_sec;
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  190  	i=
node->i_mtime.tv_nsec =3D inode->i_ctime.tv_nsec;
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  191  	i=
node->i_atime.tv_nsec =3D inode->i_ctime.tv_nsec;
d3938ee23e97bfc fs/erofs/inode.c              Gao Xiang 2020-11-01  192  =

06252e9ce05b94b fs/erofs/inode.c              Gao Xiang 2021-08-05  193  	i=
node->i_flags &=3D ~S_DAX;
06252e9ce05b94b fs/erofs/inode.c              Gao Xiang 2021-08-05  194  	i=
f (test_opt(&sbi->ctx, DAX_ALWAYS) && S_ISREG(inode->i_mode) &&
06252e9ce05b94b fs/erofs/inode.c              Gao Xiang 2021-08-05  195  	 =
   vi->datalayout =3D=3D EROFS_INODE_FLAT_PLAIN)
06252e9ce05b94b fs/erofs/inode.c              Gao Xiang 2021-08-05  196  		=
inode->i_flags |=3D S_DAX;
fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  197  	i=
f (!nblks)
fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  198  		=
/* measure inode.i_blocks as generic filesystems */
fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  199  		=
inode->i_blocks =3D roundup(inode->i_size, EROFS_BLKSIZ) >> 9;
fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  200  	e=
lse
fe6d98750cf0459 drivers/staging/erofs/inode.c Gao Xiang 2019-05-28  201  		=
inode->i_blocks =3D nblks << LOG_SECTORS_PER_BLOCK;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  202  	r=
eturn page;
a6b9b1d5eae61a6 drivers/staging/erofs/inode.c Gao Xiang 2019-08-14  203  =

a6b9b1d5eae61a6 drivers/staging/erofs/inode.c Gao Xiang 2019-08-14  204  bo=
gusimode:
4f761fa253b49f6 fs/erofs/inode.c              Gao Xiang 2019-09-04  205  	e=
rofs_err(inode->i_sb, "bogus i_mode (%o) @ nid %llu",
4f761fa253b49f6 fs/erofs/inode.c              Gao Xiang 2019-09-04  206  		=
  inode->i_mode, vi->nid);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  207  	e=
rr =3D -EFSCORRUPTED;
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  208  er=
r_out:
a6b9b1d5eae61a6 drivers/staging/erofs/inode.c Gao Xiang 2019-08-14  209  	D=
BG_BUGON(1);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30 @210  	k=
free(copied);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  211  	u=
nlock_page(page);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  212  	p=
ut_page(page);
0dcd3c94e02438f fs/erofs/inode.c              Gao Xiang 2020-07-30  213  	r=
eturn ERR_PTR(err);
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  214  }
431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  215  =


:::::: The code at line 210 was first introduced by commit
:::::: 0dcd3c94e02438f4a571690e26f4ee997524102a erofs: fix extended inode c=
ould cross boundary

:::::: TO: Gao Xiang <hsiangkao@redhat.com>
:::::: CC: Gao Xiang <hsiangkao@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1146001107552109963==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICKKkJWEAAy5jb25maWcAnDzLcuO2svvzFazJJqk6k4iSJct1ywsIBCVEJMEhQD28YWlszcQV
P6YkOTf5+9sAXwDZtFN3cTJWd6PRaDT6BfD89J+fPPJ2eX0+XB7vD09P/3jfjy/H0+FyfPC+PT4d
/8cLhJcI5bGAq1+BOHp8efv7t9cfx5fT4/nem/7qX/06+ny6v/LWx9PL8cmjry/fHr+/AYvH15f/
/PQfKpKQLwtKiw3LJBdJodhO3X56Pfl/fn7S3D5/v7/3fl5S+ovn+7+Ofx19sgZxWQDm9p8atGwZ
3fr+aDwaNcQRSZYNrgETaXgkecsDQDXZeHLdcogCTboIg5YUQDiphRhZ4q6AN5FxsRRKtFw6iELk
Ks0ViudJxBPWQyWiSDMR8ogVYVIQpbKWhGdfiq3I1gABff/kLc0OPnnn4+XtR7sDPOGqYMmmIBnI
z2OubifjZhoRp5q5YtKSKxKURPUyPzXbssg5LF+SSFnAgIUkj5SZBgGvhFQJidntp59fXl+Ov3wC
QSsSuSWp93j2Xl4vWuZ6pNzLDU+tra8A+l+qIoA3HLZE0VXxJWc5sxk1eJoJKYuYxSLba+URukLp
cskivrBRRqGgYO/89vX8z/lyfG4VumQJyzg1+ofNWVi7ZqPkSmxxDE9+Z1Rp3aJouuKpu8uBiAlP
XJjkMUZUrDjLSEZXexcbEqmY4C0azCsJItjjlq6E1IxglLUHKckkc2G2zAFb5MtQms05vjx4r986
2sMGxWAgvJajz5eCGa7ZhiVKvossFpkgASXGgps9VTxmxTrXxq+Nu7e56vH5eDpj+7u6K1KYQwSc
2gzhKAKGg6yoDRk0ilnx5arImDQiZdKlqZTVk6Y5c2lYn2/4ExMXwOZokMg5GxqcJ2nGN81ZFGGI
Tu4yblmkGWNxqmBpCUMOao3eiChPFMn29vQVsqd2mua/qcP5T+8CK/YOIMD5cricvcP9/evby+Xx
5Xu7MsXpuoABBaFUwBQ8WbaGsJCBPn2UwQkHvBrGFJtJi0wld340ygm4JIuIBbYJ/wthLWcDgnIp
IqJPdm/dGc092d88BWoqAGerDn4WbAcmqDDvWBLbwzsgItfS8KiOShelMkLrOa0ZpQID0vEgtv2S
xiSMgddnS7qIeHXGKv24i2rczbr8w3JA68YqBLXBK0YC7YKe28ijwwwY9IqH6ta/tuFawTHZ2fhx
a4s8UWuITSHr8piUGyDv/zg+vD0dT9634+HydjqeDbhaCYJtQuQyE3lquaCULFlhDNL2WhBl6LLz
s1jDP5ZhRuuKmxXnze9im3HFFoSubUOocJKuWICYQoVOeSCRUVkQk+FBIRjOnS0+KFcy29HqrdK8
KwwyQ8A2nGKOocLDQPdgVvDSpXW5xVxSzN4FXTcTEkVabjqrgLAEx7yF5RANEuu3Thvs37CSzAHo
BSau+laMrlMB5qR9thIZ7u7NphQkV8LIhucxoQQlgSekRDEruexiis3YOnEsInvXZkDRJr3KLB7m
N4mBjxR5RplOvVoPEhTLO44JBZgFYMaOvwmK6M41Fhu3w6OaGSWGUVdDqDupAhS3EEIV5d+YUdFC
pBBB+R2kwiLTIRr+iUlCmbN9HTIJf+CbU+aSTeqzYUXOA39mMxv0wjVlfdh1IqNtq7vHbVyuwGGZ
7VgGKCTfVZmBffi0O7OsILdcC4tCUFNmMVkQyM3C3Jkoh3Kr8xOs3eKSCpte8mVCIrsEMjLZAJNt
2QC5ctwb4Vbpw0WRZ07AJsGGg5iVSqzFApMFyTJuq2+tSfax7EPKxepToviGuUfbRHJbwjWNU2dD
4wULAtebmjBQFbHp8fTt9fR8eLk/euyv4wvEegIBgupoD/mZHTH+5Yhakk1c6q8OHNbKZJQvygTa
cpVQlxEFma0TEGREFpgxA4MuGWg1gzBVZTe4C9NkOhDosF5kYJgi/heEK5IFkFlgEUmu8jCECsJE
SNgvKCPBgbqiwVp1IId6QnES4UdTsdg4e11q85BT4hZLZUVcGlezH271W5OKlCUZRBYn0BULbQpJ
wInFNI6thKiuMlZbBsm7FcIgy+ciFZmCTMSK4mVOBTVNGJElHPs81TRI1SJz68BAykXX5dDeCF3e
QISwEMb40tPr/fF8fj15l39+lCmplc7Ui878deGPR6OWHZRHELDKNEOtIGItVy2yVpIp8CHLLgK1
0PGkTNifDuezx7nHX86X09u9bu/Yc9VjjQflCRhIGPoIbwsf+bZJIBTgTxHDQAgDvnHydVTWZu8y
k8vcNkmjjK0thNrONxpr67a7Yjwd4SXdXTEZDaKAzwiRf3V367edpGY1YFIyhUCVFYHcDSlOrkgg
tsUytR0HjQPTNKq3Kjh+ffv+HaoS7/VHZ5t+z+O0yFORQE1YhqAAohtlqXuymkkZiNPgdfgp8yJb
2chsNeo9K3VaVYfT/R+Pl+O9Rn1+OP6A8eBC++JDAlqETqcCdKLbGOXJWwmx7h822F5Trhdg8FBn
WJFID9TdNUiRDes8McdjiIRGjGRDRJPxgpvSulCOMymWRK10tim0a11akSpSwpTUFrkI8ohJHcNM
dNfRzXJ3S6Ur0yKCABJp822TnTJKlCLoeI1YnXYkduiRTbuQis3nr4fz8cH7s4xlP06v3x6fyhK8
mUOTFWuWJSxCmwfvsuk65w/2u8lStQuAhMVO7U3Yl7HOpkau3nTuUphcUPVU2gVoOqpLRNseKlSe
oOByBIKsGqRO9VBLlNG66w0CI7vSSo6NLteD1lYWSafhY2HAW/ioc3JpxuOr92fQNNPZ8CSTOZ7l
u1RTf/z+NHDOVrefzn8cYLJPHbw28Ux3cqoT052jwXcLnkHCgXqmS9YtU1wyndxsdc0qIQ1pS9GC
xzpau2ZnesSQ8ChY5G/nr48vvz2/PsAh+XpsO+v6lLpFX/alzKDMuXZRkkoOPuJL7jTt2+5CkW0h
teigdBG5kEsUGHEnf2xrTsWWkDHsET3UNHewLUGfqc4xlGpytEEsnMQtXgzq1ZTxrTC952yQbLvA
SjRLHVw35VhC911Z6mYILUiacmy7HS5UDOgbUsLMLn7KdeqoaQctG9rozZFHQlQWKZoVa3R5RwSZ
K832deB2xvcIihBsSLeVegVPejhdHrXX9RSEaCvUmsTcjIWCTVfXdsCDsjNpKQYRBc2hMCe2eF0K
xqTYIevs0nEq32NDglD+Cy6p2EIhz+iwxDrr4Vb6RaAqtxfapqsybBHY1DFfEnwoVDQZxwe3bojQ
d9nHMhASZ6/73gGXa6jWGBpzeAKLkvkC2UDdtwYVFLv5DGeew9gtydi7M0RBjFmHBnfqW7nkGCWU
qllH8fWAHDW8NYGwj0vMwo90rS8WZ/MPiCwnhFHVGW/nONnHNv5SbDgMFnXmxUXbb7ZOHtBxUfYV
A8hX3ftgBNn2klvraanW+8WAz6wpFuEXdC2ueI1dy8Qq6ypPI1OemNQIckznbrDC67y7wr+HQ8ea
WnVosI10R5ukXCfS5lo4MCJqKssRD2O6g7MtPrQHb/vpZofZ38f7t8vh69PRvKbwTIvoYu31gidh
rHSy7/T13Lae/lUEunKrL6l0cVDfmfzT4SVpxlOnT18hBjrrmrtmbtd0Q3KbRcXH59fTP158eDl8
Pz6jdVoIgdbpCVZ37829mHWg0wiKllSZHTR1+VWnsKGDZ9L0lzKmUy3IIVBXt8w688E/qkya7Suo
tbSErbUcx0TfR+joEmS3V6ObWcMEKsGyDLSrcOL8cO7CLbDpCGP7ADhwrETeNrddd6kQUXspdrfI
A+vXJBSR/t1wvzNlkaD4aQ/qhpwuldcdfbUqZZnujOm8UaIES8hzuhfpjd0Mm4Z1Qc76t8HB8a/H
+6MXnB7/qturtTyUkqzfpzWF5ON9NcITXQMk+Y5HnIDJLXL73qcsgFcsSu0uswOuMnTrGgVSVRWn
Ia4P0FQSkKhzNW7ffxveIc9iEzfN45neesLH0/P/Hk5H7+n18HA8WSdpa4pUW9oGZLYz0HeclvPY
wfY2s1kPcdpR5vKrUUEjKUqAJo69AXWxZLuQ7orqUVsC2tDJv+V36k0zxRSOw6FpXHyBNKh93mG1
YuEXBKt9Qosg4xutLfNGxzovNXzofUht8XXTFs5FeddpN+0FdU0sY0unJVz+hjzz5ro9uxWQj2mP
UEY81gy7tNK+tGlgcR+49XugOLarknpyO1rWDEWeBFuesXZ60xtbgS0ZQwttQ9SoEIqM0qWwXhe+
fz7L9ytvZ+/BHHj7wGZxVWfqq4Iiip0ApnyozBZ45adxO46W6DvFVLuSFZfgE+BHEdnPyr6A9RZs
wa2713jFi3IP2oyqBJVOHX89Yy2rMZ1EWjupf0Ftl3ES2awNONavFgwKs0AzkGdhO9rG5IsdwjZG
+xaBspYunAt4oR8KcTVwCgCrH4YEaiFtBibU6+cnDpCRLNrjqLVY/O4Agn0CtZIjlQm4pT9pYY69
Ct0chTVvwCydRKNEiGjjzirgoDv36ZDGuxctFQBsaT6/vpnZmqxR/niONcpqdCIgj7HWUXU5+k2R
JAdFwg8rXQgyEdtT1qSREGk/WmaLwHt4POv87MH7erw/vJ2PnnmoAUHq9eRxHWPLIU/H+8vxwUo4
K8YZiVsrsoBlc/jWn2E4fYnu5kFa7iJdKxpsrNTEAVduQ97OrTzIIdiaTArRbFkuGVU9l0tPNjHz
5NuPH6+nS7soDa2vwts8QwPNjbwO6Ah3Q7DaOu+cDCwki6zsNzhQ2uMOdfyS4ZmQI2iZNuv30j2/
J1kiRSaLiMtJtBmNLS2SYDqe7oogFZaZWkATPiybsVEQLbDDn8fxvlNkUXkzGcurkRU1dO4eFVI6
CwY/HwmZQwajj50Ogqg7Nt6UCg5RAW14G7x+hJql1FpqGsib+WhMIstdchmNb0ajib3GEjbGrtVq
TSogmU5HLZ8asVj519cI3Ex+M9pZkSKms8l0bAVB6c/mzmMZ7dpACQWj6QR5rNKmh3BuEGF1dpqA
1w5C5uwhHWtX0jvxjMHpjr1z1/BLOGzY+KoVtgVObdYVOGJLQrFOboWPyW42v5722N1M6G6GQHe7
qz6YB6qY36xSJneICIz5o9EVemw6Cy1f6B7/Ppyrq9xn87Li/Acklg/e5XR4OWs67+nx5ag94v3j
D/2n/T7j/zEaO5sm/+qZjsGUx7DJYRWDBByqgtQK04yurARMP4ezMqx0k5LEDoAVoEzbnq3qyvYg
5WNGKnkF6RuHuR6IhdW3zQgPzMcDdgJL7ZewZkwQOy1bA6ujS9cyjQTV1OUt78+gyT//610OP47/
9WjwGfbzl378kU7lSldZCcVfqDSD8EZWMxp9L1Yj6aq3KPhbl28KK8cNQSSWS+fxkoFKSpKytKj7
PEYLqjYop4AtR6S81PvQRFJ//tHfGAOP+AL+6QmvUfqrCn2/Pcg2Sxu27RvXjrAdvlCDmRvmgeeO
2j5W6NnFjNFpeuONbvwRYBlaTVDvf4/BGPP8yc2V9zNUmcct/O+XvvlDDczcUqaGFHKRju2D9S5D
J+b3ZXn58XYZPII8cb7zMT/BAweyCwtDncZGdQ3t4MpvLtYx+pVMSRIT3S9fl4WnkSs/H09P+sHF
o35/9u3gJB3VIAGFvpOguvAilSTfDWIlhdQ+KXa3/mh89T7N/vZ6Nu8u63exB5LBJbENIhrb6NuD
Z1v1vdaRM2DN9gtB7AezNQTSJcttW9B0Op3PUXqNucHGqPXCcWcN5ovyRwNPhxyaayyhsSjG/myE
TEyjVF77/g6RVt8MgNPk2Ww+tU2qIYjWIPR7s7JUB3eE9TI1YQkDF/oxKcN1oSiZXfmz95UBRPMr
f/4+UWnt78kexfPJeIIIqRGTCSofJD7Xk+nNB1NTPO1tCdLMH/vvySaTjSzSbQYAREAe71DpErZV
A13whka/2tIO8wMRJYlljrbL270UURByuSq6n121TJTYkq1dUVso/bcOkuhKYO4PLA/mNQxQuxXg
5LAq3DKhCRzTHaJbFY8LJXK6wlW/M8cYm1N/Pwg53PtqpSSFo/iuWS5ojOhLt35S3QF5Rryo1ZTS
P8EnjxEQpJ2pxOCLfYCBIa/h8G+aYkhIbEiqnAIYQULa4fQ9WxK6T93mTYsyVw/mowrntrLBswiy
MUaxat0SAUySRXbCbE1gtpcrDBfqr1k1d3Rd2GqQppqB0z1JB7IZUb7dgwQRyoLBZWzkbrcjpM9Z
O9HBUa3uO5V/E1Cl/lQOv/4xJOYBIdbdq9Bae2XMthrpLRBioLyeX82GkNfz62t7Y3vYG2Rql8hZ
l4PKIM/wB7TqEJruRbxTA1LmEKX4jvKsPW82fpGP/ZE/wQcb5PhmSEb9xa5IWMFpMp8MRDGHfj+n
Kib+FRb++4RL3x/hQtO9UjItW2DvETilKoJ3itw+/qrXZMNoPt6imrK800CZBeRmNB1/qEHdPIbS
9EO6FYlTueIZ1mW06RhTfGh32ZJEBPPvfSLEczhEOzrB34bbVGH+O1cyH2KyFCJwsyB85TxgDKsc
HKI9AOG/VzM747MpeMTB9He4dQBSsfXAQPOtJzpMzuT+euYPLjBP7vBLVUeXaxWO/fH1R/sSkQGf
xiIxJMGW6G7ldj4aYRldn9K5z7PRkFv6/nw0uFRIK6ejgQ8JHLpY+j6W/ThELAqJLGKeXuF6j+Vy
PJvMB5Dmx5CgkJ7O8qhQ6EsShzBhOz6o2Hh9jT4GtmkgmY3NXcTQIQqgbFbT3Wj2kT74Ugw4e/N3
Vn3ag85i/t5y7AmeTZbTBXjx0ZCsZcD5cHu3gZpf73ZdD4rTQiXjf3z8t/HNNZqUOhraySLKnIK4
pwMORehkAC+v5qOByASWYpyhGESPR6Nd5zvGPsXV4P4Y9PSDBZZUg7lJFhdoD9BxVjzSH4/gjozL
4bMvlT+ejIemlioOP547T64GI6XMs5BQNune+eDEu/ls+pEDUamcTUfXA5HgjqnZeDxgCnfme4WB
HEJEfJHxYhNOB4wlE6u4yrEG+PMvcrrbDR2zO/019EBMrGoq/A1cFvOrjg0akPtAQ0OcDKmExM6j
eQMLRxNUiBLp4x9lVEjML5aoyag/0QTbzApF+uRT56SYNtrqcHowD3X4b8Kr29fVoPLk2p1nDdD/
7V5TdShSkuFFfokGQ3AK2RKakW0XVF2nlMTdOeQ47nzT6o7NqBn43AGn2NwiSvXrf5l2EebsYXzK
fpfNKa8dXfu0g8Ssr6mq64wpvulIY23l8lrhj8PpcH85nvp3yUpZ7ZiN/X+4IBIpIvNMJ5HlA0xp
U9YELWy17cOArgXrR6WBczWiX4bfzP+PsWvpbhtH1n8ly7mLvsM3qUUvKJKS2CYkmKBkOhseT8dn
OmecOCfJ3Mn8+4sCQBKPAu1FYru+Ip4FoFAoFCY6PGppy9NGL1F5G0Tp4lHQ1XDtEOIpqHtW8nzl
+fvnp5cPn2wjr1SzpbtJZbp9K6iwrm5KL4LXr78J4IdMVxxeuednMoWS7LkAdkForO4zCJtNjwRy
mDQMLZWgz03pHUaccbbw+rNQ1jxTbFf6dC37gU3JNv574kFXIbBLJly1/MUS8DSYEW1sDGsBq6HK
MQ71C8wGfTTHJKdL86lDW+rh9iCgs/z4ywGtBJscJ/EZgFvFsilDJwt2mliF+WMo/MTAIy2O9L2X
A7njcRYRY9nSiN4vCCOYTDLyHokUDhzH5ozrGorpNhQpur9VOBhxkb5g7aG9bUgDWAfbe+zDqjqP
6CnojIdZy/JxtEwkNuxHlCrgZjzjuMfNLPEt2Td9XaIjaV+RLEZ19HmSkYvgH0N5BBFzCqlwgdl9
rWEwaOStRHu060z78lr3JZf0MEy16IoIp1e8+G6iRAuqvF4om1CYgCF2O+mZA2lGvtxvieSBcfmh
8K2/oQVPez50zYgWkP/VjMJ/uT22XJ299MjAs1k25lDhoYxGO5qXCa7ThnGKSTztfeqVSJjEkdu+
t2Z/9TWfBN+ckC8PHVIaLtobtWi7fcNXdK4f6W7IGDrh8mny+NsTJmK7h1f3BFOHsLOohr6zjjYV
dJZeIrVxjHyeTnWnbQ6ET6ehgJ1us+e5U2dx3VY/btDoohw8Ics7FQIB6Sl1FGsHSvEjdeVIua6C
it5SggReFFTK9cQ50ta6iRKIcE4SJ4PYSQKwSDd54dAtNqdWjqx1EmV87velJsJ71pejceQhSgLX
Oa1ohjp+V7FpT4x5u2QUwtgBIlg4jLmG0orApK6zWe2j0p4qcUNaOuKbpZs5xK4AyUQVZT/gWezd
VtTVcxmnByHJgE3tRbpFL0Va8X2ZxJg9c+VoR5oIZQT5WooSOtNqCXClqj8fsaZdmeQkhVRAas1f
EGC4wwvVjI/nC2ZFWVmgS7HM4KR5gJgCSH4VH4y6ar0iY0tPfCE0bpM0N97kmGml4v8owTIA8n8N
vpbNKspq4ZB0X8r8C/PYZiVOVZ8GbgZclZGI8w0gYkuD5C9Avji258bjiKAznq+3i89hAfhuvOrg
VDhirqhLFYY4/kh131YbsU60bNRoGK59dI9wh6PqSv1axkxHOC8H3U3M3Xpr5hXVof2VL+oQwU5e
jXL9xaIKcRPTzUzQesIxgLe1YXsR3SYivWDzHYAiJNdNm2w5kVzH2WGK/Pvl5+dvL8+/eA2gHNVf
n7+hheG61F7aN3iSXddA2JovZkF4sr7D6hWWeVvkbqiSOMhcgFblLk1CH/ALAdozLJcu0DdHk1g3
m/ykGyuqLlPOzrZbjWW2hboqB0YLT3MwdaVrEYHy5Z+v3z///OvLD6vhu+Nl3w52twOZVug6t6Cl
4dFo5rHku9ic4LYS2vWndkxPdTRbXoS8iriuH/4BF5yk9vThb19ef/x8+e+H5y//eP706fnTh78r
rt9ev/72J2+q/9F9YGUhYeeAm2YBFouhr4LDLnSahNMgIt2tkeEZ+aJ3HtDbU4J7HNvSToJvvKIi
xs4OFLocXtqfTXeXs78u+74ibMAi9IlRChOLqWgKCS1vXDpbcx6oG4jHKO6N2ifvFixawpOjxgZa
HYRIsrJZtjNGkRrS6BFJBUkstKldkI2ZAKJe8317bV42lQjDjQhioSGYg5pE+BxCnSmzvdDY1FmA
+sfHJC/wc1WA7xpCO5/UdbSK7sxMLM1EkIYsHe1pbsizyJ7IbhnXqWzGkZkZKMXTJF6EU59FkxYU
nfLQmSx8Slj725JhSriIov7EAJ6tYtKxtJIeSylxJlle/qlaO7dtmxFw9G2LKYsCuout9mBxFSVh
YPc1O02ET57o7lXgLRkaZzR7NtICGsxmEArrIcGIuUW8njO+PYkerPHMHs/3V67J9yZZGkT3lFhd
ej1zNbO1uWfqdLBbAGKNlUPrMeABxwPBT20Ak9YZT1uMnTN+x47uULOV6LWq7OcFr/nFdaavfO/N
gb/zpZCvI0+fnr4JRcq98S/kq/QfMIkGK8EhE3HHv/z8S67XKh9tzTKXOX3F1ydn6ek5DdezL9Cd
dxk1peK6t0TCHS5q9RJXnhyxFBjcxYU7ud6JXURkNAzAKx3UAowuLQ9GfRC9JkbtUvoldNhgEHhO
wozsCtTG7Rmwj5KnH9Dp1evXn99fXyDKuuO2L27KCFXBzEgZHu1VUED9Lk5Q86m4dXPKd1ZSPSnr
coLnXDRbj+CVOx+bNPExWztVL0d5r4drx0aEHqApzQIllrpSrOhg/0WJ04mZF88kNN271HbYl2aY
NUG+DmA96B7RsST2iHyfckZjDGqo1gTmxxvnU7TVNA+zsPWDumRm0tSFN5O4H0KMBncb5H0Xo0Dy
1oK3stIK7LHVK9xTVVBXIFAEbVDf+YWFHfhEHJtOCgCeRzqBZdnnpgE8Hj0KIK4Q8Z8HSwjN8y5O
+AMbIR3Jg6nr8LiIgoEWRRJO/eAZ9MoyvjfzAqKUQ6eNa38Ty7NP/ltVufOGgg4eUz7wCH3Ll/as
eFmf3E3nC+5+JXqGK13Tob1uM2xIjTyXEjemraxF3MYzZuMQKBfgKHFFZWjFAN/4CmIL35micOmt
wGdA5K0cYw4lCzaxe0ukuG4XuUXi+6A7cG/2tlFPK9SCKzBntrrX374QhFlFtDPmyh4ozp6UWRUW
LcuCyEwNVEHWKuuNQfelc+IzrTvm/QeSAHLN0awVUKaythp0tnOaKQ8gLnjYVIGD24kvY9AurZwX
xdIgk1G/ViJEC1TNKAzELOfIHYCWg6nLEAV8jutKb1suTHAFzc5iVl49347w8IzdVl7FVIAdNWs4
Ds2ZlfzHgR5LO6mPvJ22xhbghE7He2ReK4kbt0loNZqlaDWpmDPQdUQ/pd9ff77++fqiNCNLD+L/
DHOemGouFwrxmGS0I7v/uiaLRny7KxL0GAnEqmqHYTGDCzFxUsTXtzgzYigAGTwH4AITmA01Kzdr
jT8Mo6b0POP7/z8XXRAqv5JfPsNdfe0xLriufSo1+abUCNDD/8SC8yj0PFDgcDoBaCovrO8g0apr
IYDXnThWQRPXuIT70ltMyO7GZVIWoqWU6l3G1+96QSU6UF6H1z//ZQPNVxHBj54e4VU7uAx8bgZ4
KXDiJHFMxIaSUAgF9/OVF+P5A9898a3ZJxHBku/XRKo//lcPp+BmtpRdGVcXkZnjZilgct5Pas9E
v1+s8YNN9nA9V5anGqTEf8OzkMDa3irXcqRRgN07WhiGXcjbOjGzEQipXeKehEURuPS6LNJgoleK
fNNRvkzpVp0ZIBWNYhYU5gmAgxp7Dxt1kXmt1saKQiBKtXViPCNjmAa43rywDOSAzcIzztNuzuZb
eTN0qZruggr8XJmW77yhzBMTgo+l8YAZd5e+EvZjpA/lIesxQWVDgelmvWcu/OryIhewu8Pvfxos
+q5QAzLLeGlAnqtkBk/0Dp602C5dFmeRp3QZImcyX4E4+QnLubOfcdiqx+P5yuz10WE741eaV5j6
tk4rSzTJ2Qb92iqAXdGm7/R3N1fJiHNkKpDs0/6YVAOaoTTyblYJtPD0bZZ8q9iWn99SanpfBBka
yUznKJAZsaX3SRAa9x816I1UBUeOp5oFYYGlyqtQRNH2yAOeLMO8DXWOXRZgjUFqssvC7QkAPh/z
raqJDMLMnXAFkMa+qu1y7PKSwbFDZy4Jvd0uu932tHBfsSTYqpnYlwktjxraoYmzvQ9nVR4WAbIS
VXmELaOsKjj/iHxQkyzDPqhJkaQY/5im6EpHsjDa7nDecGG6JVAglWmA9SpHYk/Ej1UbKBm49Rp7
EPk4KNfxfjz9+PDt89c/f35/wazjyxrPNR9WYk4hS0lOEz1gPSLok1pmXRD0rsm3CMOX4lhwe2bi
XH1R5vluh52uumyojGupbDfowpjj0TvcBLf6duVK0RlDw/F7PG6xtpbdNbnY7Y4VDLeLkr2vnbEB
pKHhFhptl8Bzyuoy5u9lLN/JmLyPLy5xu8Yyoj6WmFecBiO60VqIfFtYknd1ULKZxZaAJMi6uoLV
G4Vrtmq+spXbUpjstwdE//H8Vj7slEdB7MsF0E0VY2Ha4a3BMZ7+BuYVckDjbQGa2dL8XWzFWxIh
mLKNAsXlW/OYqJNHbATmnXjZabSuMM5vPXvWKGclse8lzYB0IcHylQicz2024Mq2KQvCSwDbdCuL
MgLQHtlBCqMuq3YFqn3Ytl0DOCTRluVB8Qhh9SSQJ1sKouLBpF1AJ3TOEBChYZq72NBO7aVWTw87
ZcKMt+pJiE+fn4bnfyGai0qigYeUif6W7aKmeojGa8g6nVyMA28dovB4DQZFeYAsbuK4CGkhQUca
lQxFiO3fgR4hrQn5hmgtsjxDdFag52i+GV83PeVExQ9KlGExMXSGHJ1oASniNz7FtQGBbE1rnCHO
8AZMQ3Sq41WPdzk6E3mFzk791jJOGRAb2kDoLc8DZGA399dWXFfXH2oFrVi+kWYSREBjiDI9dS1p
h9/T9UH6y8HStOdP2v5e2OgMQNwm0JthIU43bOkUsDKCWinZ7xAIoohxF6wOwfK5ji9P3749f/og
LCjOwBXf5Xy+tE7nBV15alhEaYrDiIt1z4CEi4bJ3nP+fdP3j3CkPxp3BQW+6YO5cIxHJg1RvqZT
npp2J0ifB5vqBFsU5PqhpHunfE3r9SyTOLEqfBjgRxAGVvKLhXt15DPg3vQkFUQ4prFJ3UNtpdxe
bOmAqHDVrXIqo8zX/rZWV1R9lSX7ImP5aBWJNOePMGtaVFoV42g3sjrXt4ijW1QyYltieVUfTqjm
frFyNRwcpQCC/5pFqm0mruOUaR3xSeOyvzrD1nt4rNCL3SLsDMc/4LtuZSMLbKU+0Gl8KDHXAok/
wqTnFMq5to3AYYEpHRK3Qr0I4uKmaJKXadckP1Q1+Gs5FRpB1CeGv/IhOXznwBLtqFPbktTTAQ0n
KIdAPcRREo+G379/Tlwc4gX1+de3p6+fLPOMzFXGkPXlWtZnag/jh0k6I7qTtd3YghqNTlUVHdYV
7wiAexSxLXWKqp4FMBMVGBqcVsGHIs3twTrQtooK0z93Fp6dHeRKc0K0WlWuUIf6zdbu24/WSmBM
8TWvQUgebo7AuSHmHDR1PnI9xu2psMhjr4wCmmZuqtB5XCP0NnRfpUNaxO4U00VFhXuwyxZXsVCd
nhARfjaGOeBRWOAfFpm3ggLfhZHzoQqQ5W+4jXhWC+5voIfVUj6PY1dyFrcLR6IsXSfMEnfUxeEu
dNYwMURDm1rFsXFGLAdLyy7MniPHHqI/xvbKNr9ctF5edkstanP7/P3nv59etnS38njkSwq8quTk
Ut1djWf/0NTmb8S7UiLT8Lf/fFa+z6vfytJbD6HyCp5qFiUFNsBWFmsN178NH7DLlCuHqUmudHZs
9TohhdUrwV6e/u/ZLr9yvj41vacIkoFZV2wXACqOxiQzObQIfBYgHsUENx9v8iEeYMpMBz8fMnii
t9Mp3q5KHBg9oQGhp45mEG4L4koQprKbXIWvbSw/BoQjLzzlzQtPeYsmSPBPiibMEXlTcrVsK+Gm
uniySr/UvxLFTgQ2NMYe2MLxO2U617GBx32Xe/G+xPzH8hYT/DrgITN0VunesVQPTa4bqmjnieiq
88GG3yOUOhuf0q4dTGrv4HxPFZZr4J7iS3X6jUQk05vN37vXlFY3PZlE38AdYni9BdtAGHlWUW66
jsDTU+RdKbArpd2jLZCSar/UbGDWq1m0LiWurTBq31rW1bQv4Q6CFnJdrvUTTHBXY2+vAJEWNoaF
DqCyWm99w0uPVvbgKniEO7lcFQ8ybVCrskxlNRS7JC1dpHqIglCzUc10mB70Vxh0euGjG77oBoKt
izND1xwvU3OLsY+Vl9XG10x/oW9uCCAuRYRH2R3i/Pn+HgRqxPJWkDc+qc13qrG9yNIMQv92i8rp
YYo16Exf8hO+fYi4GAxFMR2uTTcdy+sRGwpz8hCjNw+SwO15hUQeJNJtQnMl+NaIC14cuwj/ptgF
WnzLGYDNgW5Fnun2WfyakOhFpEpLikOcpYYIrkiVhFmEP/KjlTRM0hw/zlp6qxmaCp7sFNxZiu0p
tATFNgcrkWiWHWaynjmkqwnZ77HPucglYYot/AbHLnDbF4AozX2p5ugNcY0j5fl6PuabL2zLonPs
igDrXIAy1KS2jGiyj5PcFSO1d8vdASRGgFyIE2RKnB/9cMW8H9LAVNjmzPqBT6Jb7QPLU2yI4DoY
1dq1KV7XioVBgKsNS1vVu90OjWrbn9MhCwt7xVgXAVgiUt3GYq1s4s/p1hrvgkiiunxp3YmR8SWf
fvK9ExauUr04WPM2MUIyLvQkTAyvfh3BLEorA4H3ETTPfANI8UQBwgasybHzfozGEdI5wjxHi7Tj
uxMMGPIxDLCGGXiLGQNFh5Jw60FIyYE2DQeyyAOgT0UKIEUKeBpCjN90EF3JlbJnu9UZ2+lQitig
Q3/BQ4vOiahjFjeNYaRbHQO3J+ltcIurgKnsyp4wt9wV/69s+6mi/cX9ekYpu2I1q1m2+W4nvLGJ
CbBUE+ynQQwUm4BmBng9bUR67AB+iekBKylARXTwPOi5MKVxnqIP+s0cAxua61By/dSt1bFLw4IR
FIgCO0Cngrj+icfZW/DIrag8XtJfP5iRU3vKwhgR23ZPygYpG6fTZnQTauGESUyc7idDkbsf/FEl
SEn5LN2HURRg/dy156Y8+iKTKh6xsm0Jg+RACqQA8x6GDTL0CVAAd8gglwBSTaF7pYikAxCF6FQt
oAhfBg2et6qfRBk6jUpoa9YQb1iE6KQFEPoCh86QBVnq+zgLMT8Zg0O/gKADO2SBEdZay5nLxGLP
JbmVKcvQZ9wMjniH5p1lCbKoCCBFBEUA/mrskAFKKhoH+oHo8vhxlaWIYsF1wiguzKdWlrSa8yEK
IVChGMJbde7zNNJ3LuuyWJkmiEWqSIZ5kqwwtjpyaoyOAZJvCjfJsYFNckRwOlKgGRcxSk2RsUqw
ea0j6EzA1R0shR2a2y6NYqQLBZCgPSihrbahVZHH+MAHKInwPd7Mcx4qaQ1vmWVxsxmrgQ9UpFoA
5JjixIG8CJBZEoCd+e7HArn3Z2wOVsYRWt1LVU208LxRtbbJoUh32gxNyRw0xeYE4A0dOMoyt3oC
yBHB2jfggNlgme1pOfUs8wTWVkoHo1P86ObHl+6pOhwootXVlO2ioNwji/eZ0Ws/tZRRtPZtH6fR
5jTJOTJ0ouIAXBfCU6UsTQLcl3hhYl1WhPHWotORKA2wthcrc1541vK8WI3LnpUyLsKt0QbLUhoH
3qUyw+9JmctdgCgIHImCHNPYJJIiDS0XEWwKAyRJEnxFKrICaSAC5jRsIaa83ZDRTVuSxBHyASVZ
niVDj01ndGy4QrC9QN+nCfsjDIoSDW4xq/4DresqQ5qLr4dJwBUqFEnjzAgZpJBrVe+CAFVOAYo2
h+VY0ybE8vvYZdb7BqoRHohQ2pHcdN84Z8l2uBniIuAy7QeGh69XON/eIhLEydjY5uT4Fyb8HEh+
bWdTIenVpOEaG7LcNqQSp+dII3EoCj2v8Gg8GRj7t0pEWJXkBBmLM4It7RLbx5hSx6oTGPYgkqth
aTLwyPdhjExnbBiYHPpugxOSZfhdN013C6OiLjx3jFc2lhfRtgWKc+SYmYU3cxGhmkt7Lq3L+SjL
5lrPGeII14VzdH0ZTqRCPUkWBkLDAN08CGRbqATLVjtxhiTAisvpaDUITUNE6b4NYRQi/A9FnOfx
EQeKsHZTAmAXoqYkAUX4SwMaR4w1lkC21knO0PGVaUB0EgllVjyzFeQj5IRGGzJYmtMBrZTjaoQw
GOGxQfcttdAWisCHXjm0zHwrecYa0vTH5gwPHanz4ElcrJgI+z2wmS2z80y+HFzaQ9+KZ3ynoW8p
km/dHMprN0zHy42Xr6HTQ8vMN1sRxgMY7tip7D0PbiKfwGtXYF1DQ8fNH5hpu4V9s5DAAHHtxH9v
ZLSWSDvkoVet+5bk6+Z26Jv7GdqsdEOu8s2sjeyFb7x+RACR4JDEFQwxbOdSfdGIBSGusN3FWA3u
L327XX5Gm7Lf5riei61izoFE3DKBe7RbA0HlMh9r0JLZXdvfPVwu9WaJ6svseOVhUMEb/WUGg3AW
uWWD60FrNaQr79efzy8Q8+b7F+NxMQGWFW0/tOchToIR4Vn8fbb51vfcsKxEOv/P2JU0x40r6b/i
09zeBHeyJqIPKC5V7OImglVF+cJQ2+q2YyyrQ7ZjXv/7yQQ3AExQ7yDLwpdIJvYEkMg8vr0+ff70
+kJ+ZBIePYeEtr1T7Mm3yLalJsMhqgvhE4mK7zMdeKtkncpjFFpI3T3/++kHlPnHz7dfL8K30k7Z
unzgdUw3+vS19/mNpp1PLz9+ff+L+Nj0qenloNw5Z/tKQ9Y5p2zOsmYXX3349fQNamK3/VYvCoJB
Sa2KK02Xls14ByOLaPzOzGDxC7zpA+IJI9EBLmcYS3iaeBV3TuaOsERg+UdP2XhkXYCqvrPH+ko7
8V2oxuAzImLCkFa4rlHKxkJeNxifNC9TYLyuogvMH3nGCSHPrfDeNTRtOmee5oD7089PXz6//vWh
eXv++fXl+fXXzw+nV6jX769yz1k4rRxwySE+pRKASqFMgiayqq4pb9wm8oZV8oMvikxeqmdytcTJ
GF0y2XZXXmfdwtQwx/qOHJdHBnyiu4hZ2TUBDhniZzTsNkuxHlxvBcHHRVZwIPlORmY7nCc7sy3b
KYDZthgf87xFg9AtMu+/ZUhfzVyMNbQjD+PlwQkogdB5WVvi4QNZVIQ5Kw8097W9xTsmb0+E2Q8w
VYqsuyedZVt7+Sef7aSUyX0v5+jRl/yw8IS6k7Wpes+yIrKjimgLBALaFkwW5Odma5K9Yl6rPid6
wRxQiugfsL9z0Viu7WICHh9ckUDoyAyl+sQLJdfQo2SiMAyc3UYDjdTBoOSKjhpei0ZNhEnnSgtS
9xjND4ipqurw3SBZ0aM//B3BxFqJMvyzDnh0HXzqj0eS4wjvTiZJzrr0QuZeY/ntcJheSdI9Z/TW
Y6iJGW0/MqVM05vZbR/lHT5mtAlk0QGo5mi7xLYNc4GsKWw7WyPcWxHfm9/40c3PY9d2093vxT52
Qbk3jS+s1DRQRD0xfLREofIqdTY/DJ5SFV13Tt/xEwpkoeVGekMteF6eGtDg6HYsGyyNpXfMamCO
rSZey4JqVn4cmprz/KhFN+SU3T+IymRyKVmx3UWyc43+hmuD1S5SjJEKhzJvqOssmeRUsniIy0qr
3RWnHfGNJJNN+RqO6s9f3z+ht9E51vVGZy+zRItwgCmL+bY8xjGdu6EhvPoMG6woRge2+HLToa8e
RH7WOVFoCYHMRBiZ6MrpNwcjAQYVQF/wsRr4YQXPRZzQrYU0UJf+wSJPRQW8PHlU60xYS1NpenBb
UedTJAwtoKRCU2KIM8oiaazrPFYdTGANo75Hvo9cUNkkHPlMyqbiA1VKVyx2lnRfL86oZxpEHbVT
SXsc0zRrc0zFJ8qXo3twqfNjQTBuMYWPNz3zCRYYdL/Lh5PBSbCo1NgW+oApToBMYzLEFzSNE5Du
ZwTYg4wt2tRp9QQrvg+6Bdvpfec88GBCwwbbo/H9fkMzUZw7DPEi+odURZgKBTLdVSHb/IEHjqnb
jwuH2opRBEuXbN+7Jvp684jkgHw8Nnb20RpezzYrUuZso827XtEiPaKf6K0EB8p+ZoEjzyX4RgeL
tudYcIc6gFjQQ0gyPVC3GgLtAld2jjSnyS5rRNq8YZPZpx9FgD86sICYiHbRqutTqoshhnqpKsH2
VcacotuXLumG5Wx6z7wJ1im+UqILC4NQqy9NpU+2nQe7Ur3eR8N7U/G2j8JF8iUi758ENu5g9Cw8
jfeXNJ57YdBvaBQKGHzpOEgdrWzzFlhLLX1rU2CRaH6fKEgujxEMRNNcPr4pmGt43Qkfe996Z+HG
rZixfGNEr1YOIivSN242MLXDaAGuCzNgx+O9ubRo3INHXyiOcBSSjiSmjxTlVf90w4qS0e6S8WWI
bRm8Co8uAUhD+hEKNdVh9iGg9/4xnXz3ssCOrU0NXT55TlD7yJTsyz6jJCYRkRoF/aY1RqcEuxId
bIdgBqlbBWNBtBgREwbLjUtroN298Cx3pxMCQWB57/TSe2E7obs3FovS9V1NnVk9QciJD2W/bcCi
js8VOzHK0E8odqPDDU2RHBO3g38GtOgqYmbnXlg4lCmUKGfp25bWKJhmb5ZS4fzBvOLdzW6QJ9gj
bXcm0LV7XQhxfkjozBNChxeZCXxry863tt1scWmhzFB3L7I3HbytzyVo/aHRS5NMBEqzuTJWTu8T
wSajL6/Z3nTqOjB+N4EzNjSCgmvLw3jGoZe/zPTW2LoTGrdRsRNYGw1ZVheXyw+tw86PwmD3o1e0
OHcSGiVdO+IMmDf7AxjjuRdDaVt68Hk19rBpZ7yeGhFGikvi9oxjQ5HlfZoMt7ro2CmlmWCw9ysr
8DUSv9KtuBLj9bu4fV/I5SPCmQq07NM4R1PQpKwTouCOPyLdHKs006nAFkt89xAZeFfwi7p/kUim
aaxIapsq1oxDn8U38iTJuP8mENJH0QpPW/Fd+aadM8F8ux9WMdJCXyGxHbLIgDjyozcNIfNkrPJd
X/WrpKGRwZP0SmZQyVeCnBewQ/cpAdBu2AltRmGwbgYu2TNRTQttWmiBUdqoTBKFjoGxqvSoiKnZ
Jp1o/5vjim+QGcCAjD2w0kj7XRLzVd/ECrjZEBvJSEM8hSgKvINBBgz7YIKig2uCYHtMtYWA5NMn
DQrNDA8mhmKLv1dN5P5eI4pUY0QdNYTHkMjixoaK3u+jZeN7dkAWo4ki/2BCArL3ls1DeHAMUzme
DdiU1a1GQg7g0T8MKU2HEW6MCN2J5qMLg5jRO91zPOUgGDfHnHG6+OhUz3un328PKiQsi3rTKtlk
14+pTaqzEtEN5lh65AgoMjFHkNzYSTT3kq5NoTq1TUk5Y9SoeJkgJSXfYiRDVYwAr/w43MbXOhsC
2XK+q6/xmcdtivczHQbpJHMsZyxbaDpLIaTEwxzLsFyMBz27ldACX7p5AHE8n5SmK2+m8cadsmGk
mbtKw9XXnRLol1EY0DssiUq4etj/SnGCTZ2p846bgWNdox+3fT6C8tam2fGa7TFr7u8xGncZRF1P
e63hVpYxVeP8MbKtgBm+/hhFDhmUWqMJK4o3vkKxYZ6jmeMBhOOSEY9UIpjzXbpF5yOdd5p0x0+k
RmS75MK5Pe3ZYNGOhO9V4XLiQ7Tf9lhH2qrMHmsJ7Ib+vylAPwtQEZ8csNMmnmxGMV0V7JgfaZ+3
7fZQdkLi6bx2lQVTqrrLs1yNxi7MGgSKuxIt6KRGRVCIe9rT29PfX75+kuNOTvnQjDlvrjd3Pgaf
0pNWOiWFP/BaOR+SY06lcuVcCNOTZmDXXrh30W4fZSLhfqXUPnQp+XBOi0atBUSyI3pR37PlRqqi
ZskAtZHA7rgtReByhT+IFqexmnZKy0Fcss/f1eQxYZiPn9FXG4Xy+CziGS5Oh5+/f3r9/Pz24fXt
w5fnb3/D/z59+fq3dFOOuYAQ6i20rEDlhuk8L+zA26ZjYPIOtmyHqN8Bp7tQyV+vSaDRfLotp4ML
TcJzUsSJ3jgiESqjvsPQTGCFvpoaqGQF9JmcNxii4kWp6hq68WgQMJtmSzKo37uUx5kJOSCQ5gbt
YwahYQ0SLvFNRovKtou1GpiuiLNcDi+6Aj46wEzSWL1VWPFwBHe/DkOr3w6BCbvlyTb0WDo25g8R
Jvb49vXzX3rDTbmTJqekpsbxkmNf1nNSmrJq18ejlfevP/61sRKR8pwcslphomoMX4GWoA5XJIq2
7vSTNgnlMStIhUWWimuzhngrkdzH0r9skOKWcDW5YVW6PF1Ivv74+9vTPx+ap+/P37R6EIQDO3bD
o+VafW8FoaKlSDTYk9OWw4xYUOuMRMmvfPhoWR0arzf+UHWu7x8CQkLQ39LhnOO22AkPiYmiu9mW
fb+WQ1WQXBKM96xN7iMiauYfqjhpkSdsuCSu39nkrelKmqV5n1fDBYSAVcw5MsuhpACyR3x8lD1a
oeV4Se4EzLXIQuVFjuaDeXFwHYeSeyHID1FkxySPqqoLWPkaKzx8jBlF8nuSD0UH0pSp5VuyZcNK
M51sd9yS7xokPK9O0+wHtWUdwkT1syDVdcoSFLroLsDr7NpecN+tVykDSHdO7EiOo7PSTdGhhiI5
KC4XJU4AHi3Xf1APP1SCk+eH+w1doWJURJYXnQv5SFKiqG/C8FN0aZusUIkkCEKH0QJJVAfLpnTm
lbZkVZf3Q1mwzPLDeyq/3F+p6iIv037AtRH+W12hy9aUfHWbc3TDeB7qDk/QDwYJa57gD3T6zvGj
cPDdzrSKjRngX8brKo+H2623rcxyvYruc4atNS1Hyx6THMZ+WwahfaC2jCRt5Bi+XVfHemiPMCoS
l+xMc3fjQWIHyTskqXtm5AiWSAL3d6tXA9UZ6Epqm0bSRhGzBvjT8500s8gOIVMzZr3z+ToDPvQx
rESd5pd68Nz7LbNpm1iJFjTyZigeoAO1Nu8NLjo29Nxyw1uY3MkjCILaczu7SA01kHfQ3DB0eBeG
qv2IiWh/glBoo8ON6mAwBNBZZO85Hrs09Fo60/iBzy6U2/iVtEvqoSugt9752bVodl0DNInlRB2M
6/fqeSL23LJLySCWGmlz0m7RJby9Fo/T8h4O94f+RNl3rvS3nMNuqu5xfB6cAznZw7TVpNAh+6ax
fD92QkfW0jVVRs5+bPPklFIsF0TRhvCV5dufT5+eaQ02TqpZT5VTz3lTV+mQx1WgPKgfQegceF2L
myp3M95nI1lW9WEQ0XfCYts4rbaQVAlvucbtJywLMNkVXXSwnaPeNVb4EBisnLdk196k3II+Aj9B
YDtaqVHFAllhn6FLUKYnhhWGXieSpkcb1FM6HCPfurlDZtINqnuxbvY1jrjBbLrK9YK9maplSTo0
PAoc6hZDo/G0VQI2vvCTQ2Zt5ofEg+X0OnV+QA9cWqIwb6M6ZHfOK3yzHAcu1JsNaqKatav5OT+y
0QInDJxddD9vuItGeu9UcdJ5miCDFTtrvO2MgC9zq8CHRiPjAWokmhqPXJvEdrjiTB0R0Ckw0liP
oyZwPV//rIyHEWlIqZAljZk/1Lf2dTzUYMkt9HVtUAIGdk3U9/w6QUxexy+TTHlOmsj3tCpRoOH3
0LH10yVqOzglDux8nOQi4dzhe3A8jWVt0t3OmEqVlL0+XPHID4daUeAmbXuEopF2t1SrZUgskuM2
cSq4+jGjr3txBuNqG/1brA0fSFhLr54JdBW75dpiPyWS/iJw7ut5Rp/Uil7Xxs3pahB1nD4S+VgU
b5wQOveR64fSlnIGcKPoyL1XBlzZgbcMeKo93wyVOagS7gP1ImUmadOGaeemMwSqkU9eAkgEoeu3
mu5U2PoYg+6w0eFhj7M5nphevp0y0+Av40SfhvOEaycmBS5Wj5T6ABumtOrEQfDwcM3by3Jel709
vTx/+OPXn38+v00vpCUtIjsOcZmgL9qVK6SJk/dHOUmuxfkkWZwrE+VBpvCT5UXRgnKgcEYgrptH
yM42AFTcKT0WuZqFP3KaFwIkLwRoXlndpvmpGtIqyZmymQPwWHfnCaFLdYRfZE74TAer6V5eUYpa
9m8DiUmawRYTOoYc+Qk/xOJLkZ/OqvAY+mQ6WlfZ4GkXFhV674ls9y9Pb5//7+mNeI2GNb/GAZXL
BHMYOTcAxFraAFy0rcnNN4Cno9rN4O8BQ055Ulpzax2FCD0k4G2MNBawOu1EvBiSBxpKho/NTLLd
S1DraOdh+OGe2QFlmo45bXmQ4+fPwxjzBs8yYk2IriTNuTCbq9NCynTz06Yn9IREHVsinf64AFvo
WA6nvvN80jwC63cOgKB+M2G0EgLQZB+plLVMcUNZl6nG5tjWLOHnNKUmYRSZQxNZocILH7g7WjFE
2lQJxJWdTlhd8e6L/+ZuEJgvYYXVRvwC0anLC05CohnN6NcHKiFpIq2Q3KAfG4QY13TNgd5E4S0U
hJT+Ar4vIk/+A6KEdJuokJR5NWTxZWhEVJjL6rVE/VqRps3AMoxghyUf5mBaYnZCOtA9xBZZ3NBM
1zWS8w6dKc4CCTCrG+YGDlGRM8Gi+xsJtmr8QhPPG9ohuVEVLlO8X+0r7ajDg76wn2G6K9jvTNT5
zHaULafKzRn0KNjgLqfPL8YP/yfnW1oW9VzHKIZ6oiMfl7zbFWaOZdkIBX1ttTllXnUKzVZgho0v
T4FgEe98I0+GkGZSfyaBSY1q9Hz19Ol/v33968vPD//1AdaF2dB9Y2aA599xwcT8cstl726IFF5m
wabb6WTP5AIoOei8p8xSdpgC6W6ubz1QpgUIj5p3r35GaN2qT2lM7pLa8ajjPgRvp5PjuQ7zVFbb
WN6YykruBofsZAUbcUsOq9klM3ieRJJxF2EQo0ZTKEc2i18UJr1eF6YrxaVLHJ/a/68k+oOjFUFz
wBeKqzH47koyOvko0oSSe/tecsWM/h1XEpag6apFyyZAMuqxVLDZQJMotLAjt8jqFtCBzNREvt9T
eaSAToSwJncLK+Ob71hh0VAfPSaBbRkYg9baxxWlnku8pwA0s1e4/QE957/lSVrT2vm0bo+mE6/f
f7x+AyV8OqsYlfHt9JBcy1IcrfJadoShJMPv4lpW/LfIovG2vvPfHF+a6ltWgjaTwY5jJiLf6rwj
pTRM61NNctjYV80S8vpaSZ2fV7Lv1ioZn02pSU1cbhKGtFC5iMQ8jQ+ytTSmJyVLqxMeZ2748PRh
niWU9JbdyzzJ1UQYuA3oL3yoswwtqlT09zGurZYCqmgj3Jbd5EGNaM05mm0RHXEuy1gRWrbksWLo
UwL0r7olffRjsUYFegDNf2CyZYtg3dbxIPuTw8Rb2h5rngrQjOVVd9kIZHiRJXKOwYtVdnFXTCNM
bYgreuJSXafPLYR92lRUwLGphhT0y27buttmZPEh3F4DiKIIVy9KpYohe07+xX59/voqhTwD6nPC
VMaQsHhUhAJyvaYQP9+TlDIcmvE2HROovGNXOqa7DBr0vyMM/rZ9B3FRcPgMK7r0ssNnpBsV1m0x
R5Tnp5J1qitAleKWM3JxV6l0FZokivO2vXKTKJCY9qzqzKLEzLLpgGobMtVCmcJhc7PXCBOpMEA1
V55r+Z6xB8kL0NL/tpzadMsh7TsD0mC7FzV+/GP6W+BpQ82gICOW5W16z0mzXZG1jrWhBx8RA015
szAj8yhRZ+YN2TzhbhGmD+opUQSayx1uBnmT5BkBlzgxNDQQf0SXFYHnDyWLz9psIhwbbcq/JA9N
EqvyrxAU3wRxbmQIkGC6Ayfq2fNIcLBHnJWHE3onK6PQ8KJfZYjG3hYZ2UNn2/sTV5NsQi1PtqKt
dUV71lGpyPYt80tbi/Wrq1W0jM/NnA/+iA2o6Bhdv4e2vS767KxtYm+sTVH4x1NFR9UZGQnnhijj
/ZzzrtB1oMlh5KanJSlMw5U4iR8rRludFxSG2Nbq9DX+IKaWD3++vsGe9vn5x6cnUPvi5rq4jI5f
X15ev0ukr3/jA+4fRJb/UVdILhQNNLNsiekBEc5yXeIZKh+M2s3M9grdpTcw5sQEIYBp/JPfTEGe
dz4KHTTLC5p3ai5oH99aGoFSOGe9381g25T8tIXEdSVoiOM4J0BxZfpe7h0Yq/aqyYTpY+/Tus6k
4Gv94et/l/2HP16f3j5T3QKZpTzCKDqkAPzUFaohqILuNSITg421htgwWilzMmKCRKReXcvIXH8k
760As0/uvSGn8sLJ4JwHjm3pk4u8y/johZ5FT4yLc/qx3RTmMjZ57HVDa0gop4xrwU7btRgShaR5
RVXTiKFrahJcLt2NFKKtjcxH1MweZlK07KmFe4q2wmAPjBiio/MKzruhq5sCthIFUU5Bc0nT8ig/
0lBhoSAYsopADhne0SbFI5oznQbYy6WEeoNe/Y9dfBNr5fjwBLuNPNDYy7fXv75++gC785/w94vq
6RqXLuEbluXU5b2E93iTm+lL5oq1SdKawK7eA5MSL1pLEZR6j0i0TMb0LbhClFd691Vgkz92lVAc
PGwGJk2K3WrTqzRc75MrDHoMBeGnh2uXF5xExbbgVFzJijj1kvx0ZZxsh0GbMMFot4gTJU5t1Moz
EnUHa4raOj88er8P/j9j19Lcuo2s9/dXeDmpulPDh/jQYhYQSUmMSZEmKVnORuXxURxXHPuUj1OZ
3F9/0QBJAeAHyhu71F8Tj8ar0QC6tayOLZp3RAYE9TO8teHqI4VIMv27GindSV+jBlX4qaQgKTYI
T+oSm9qxdZzVd7Hjhja4TSgEM6o1RZlENvVxqyETPrUrMEMJs3F/ODgB7XkOsU5m18L+avWMdqi2
enN+O/94/EHoZNIRqW0XfB2e06PoKZDasb6QD8imWo+T9Uxe5PoZCIwcQpdJCpaNtstHFacrX54+
3s+v56fPj/c3MmaK99c31Ccf1QJPFRz5UFvqtxCCu5j+K2WzMYjo60WR68Xr618vb2/nj6lwjbLu
d4scm8NkHJ3JbGLj6Y1FVpPkLnDyGbOSLMhUKoKMdu0iZ5YKswbdmyhZrc1WMxIwxS48s09bQ5D5
VpkMGXY0ZZNdlwpf2xYOfKKKMx1Z8Pm8MNv9ylIY30FbwEsmrvz6WibElxqOJicMdoV0ZHPjkOxk
tzbRUXH4DgaZY6SrfFKmyDiUNgdrWaRlxr6KXBjJNBFYotyZjEv4vMJkW0auZyt71+RlW8iDBUs+
rEiC0IehPg0xHJfkocSWFUlAd+Cr42illZPEZM6dhiTqZ3kz4fyUpeSofXKgIsF2DtxfQEtcpZRv
w5Vigf3jEOmCtcBmN4BlIuGJXAaGQ5JjR38DowjFYRqlMFeZrKw2YYVJqoYW8cvt8s1fL5+/fbkp
RLpYnxF3sU/ZQQu49OVGN1MbvUtM8hnDM7C8mkGL1HVn4PrYTuzuGgNf6dl0OTK4+1g2cHXtMWkc
Ufcmkzx7zmtz8rFb1xuGMxP36ndp7061V5So7JPbl6P+VxSyenAKn/HjPSbQuzCdlOW+PPF5HxSS
AyzFY4TR8xfnqry10zQTS93YB4oypy99sO+Q9F5iGNMcsapYDKZHlka+j/ocS9kebcQGzPUj2BUH
zBZo3WSz1ESgvgWJHEuB3ehoRcIZpJcZrgzh2LGrzhZbM4hdW6P0qF0IywioVQMy/509z8hxwKIs
ENcF1sYBOW3vbVIS8NUmP8QO7NMEYOlxAPaC1uVtDQtzu3CtRzEDgxtbPl0EMIDvhSHwA8unQbCY
XQE5S+jOqUzEsEBSIDpqL06PIH/g629BFCQILNGexwmWK1zebDGlSobSX6VePP/xquMbcbAAJneO
s/QPoL8ODy0t82fS+kGBSyOhudJIjoUtVdjSEsKOFy88C69YzGmtgiMAjdcDtglJwtdThs0vIOg1
QeXwF7Zvod9RlSECC4ygu7YkI/fKpNEzwYmOsOMRzFc9gCdADvquj0vqo/En6EtIjwrX0kls/s01
Dj+wpBrbALTDkQCYIJI28AtY06PnLBZ40HAogoFWRo1ZHqZYxiOhXrCyWEt6hvC6zkRskTWXAqwJ
KYukU2KwleHIXLcXDKAfCTpoeU73PbCQ9Q6Xp3Qt6MdA7d8ywApmbeSiiYnTPdRH6ZwQ2Vtt54eS
jgdIj8Eht+nKEK3U25Qllh1WD6FTWDGyfNBzyR3Oqbn1HaQa5y1bZUWRgW5RLpZ8hUZ9YAxtcGrn
up2Ma4USkBYGGJJDZ0FDtEdA1xCIH0RAPBLCc6fAglk9R7CEQHsUwNKzFWbpwcWjx9BNc6PAYGwO
CO5wI9qmUL+UOHQ/a8jDknaIgLaPbEgX8JGt1eChSJAdA7ca6qR0wxi2EkFRvLyyxAmuJVRme+hr
CeARS6D0kwlT59AXUicuW+q+44AJRgBI7j2Ae8IAWvPikgYjZUDsiQrUlipFG8GpBq73XytgzU2A
MDM+pcnpeHoIdRu7c2OrKbhiDSZeTvcXaPZoOi8CCwgnx2BO5eQlaMWmcx1kHBB0MIFIOjA3CgCs
pJyuuevX6LhAnN5PFACjo0GMBYELxRGELpzvCJm5+zewLOZmJXkjEueKlH9Bh1IKQjSWBB1Mt4Ju
yTeEUg1CpLuPVnNIt3RxjsVgSZd0PGZ6zNJyEbriJMjWL3Cf5WTbEjOACSOOK60eucGXuaYJGoz2
W1wy9Bqib8reImlBsJRHVDkInLAIZzeM/xUOhefK3Yd9M6/ACcx296xtS8935raRxBEgXZyAEJmt
egD3xgG0bKc5vAgs7s1Hno75sxsiYkCqB6cHHhjNdN1qGYVgFm7pWIgBg2vHWi8I0EEaASHcyREU
hXMaouBA454DZnw3FYrgEzuNw4MbMQ6Fi9ltcce3Vgt3CT9es2UcobCmGscS9MeuOPiew/LEA5Ol
AuJxozLATnZhAG06gr57nCsa72NgfdJgWy/WmeaeKOjc9iiyiHfeBC45+VbPh9uvPqE0ObqzK2bX
+szzIrC361pp1YGpE3bF/NqH4LvGQ1H4Zsq3T5nro425ABaggQWATl5E+DJsY+wjm82WVfDEX+K5
sgLJsIKggKXjuKjgpesFzik7gEX2vvTgWsbpHqYHrpUO5rs+DCCg9374pzKYBPlDLIH12dPAgKYO
QQedgeiwycsYqiZE94CeJehgLRxfkKCqRP7cPoIYFtZPYWwajQFLQa4iMEkYa0plQMoip8cOFiyn
42m6x+AMLa6r4AZZovMl+Z4H0xeWdJDhj+hIcRd03BGWIZbHEhuCBDK3ogoG3IeWsaXqyPws6JZ0
kMlL0C1VXFryXVpEjgxngg5VlJmgoBrLnCnvvlw66DyX6Li2ywjtY20XoAQdSaFlMYX5nAC/FH4M
7SlFuYgDeLOJTF9RMKcwCQ60IRRWM3xfigLQR9Ar5MhReKGLpkURjAubM0UAr7k0jTheOv3EkiTN
wEVVDochnJp2bB/77txOhDgCNNgJiNEiJAAPtLYEgEQkAHWArmah6zts7qxP3qbmfYauATbgWFUy
HK7gzXEe7y74xfmBdk9H+05uDG0X+RXYrLa8dLRpWL2de4JArrfUS1TjG9r+CtE2T6f3eDlRferN
f55W4mrTA991Ndlu06HwZJytYfeXxyd7SuYPPZn+oe70Zvj389PL46sozuU+k/YpW5Drdpwvr1aj
7q1H0mm9VrxmELWu1cMQQdrTK2adtsqK23ynf5psyXG7zpdsc/7LJFb7DWtMCfJewYoCuR0gtG6q
NL/NHlojKfnkWy/Hg3zErDFy0W+qHTm4V0V+oXJBWHLOypakZDRUVmRJhR4XCPAXXtJp05arHPZD
ga7VBxCCUlRNXu2NehzyAyvUx9hE5LkJZ/mmSG8fcPhgwu5ZYQSr1eBDnt0Ll/228j40wu+lLvo8
YapDTUHqjO70M1s1zCxpd5/vttCJo6zfrs35qDKzK5K6ulcvSApiNhmcRbarDsi9jQCrTU4jx0il
p9IPNQ7vSBcDZ8yFyM2+XBVZzVIPdybi2XCNTxtzRLzfZlnRGinKIbHJk5L3AeQGQDIU5CVQL3rJ
HtYFa7e6rJpMdnaDN6crMdW6M3trWdErsQzHNRIM+6LLRa+zlG3X5WZ9qgb7wBADnO3IYS7v9IqX
GYUIxFNnHSsednjbKhj45EMOhCw5FmwnnPbr9z976KHtJhG+dJ6GotNY0m4ZRWkxkwXvflQ0K/uP
VCJ5sC3ynUnuMlbqDcxJvBfx1UN94CiA/a4u9pM6NtAHiBjbFHKDteq8OpJAM7Qla7qfqwfKxJJi
lx+qyZCv6pbXzSpfcoi+sc2we1pKT3Xr62K5z/OyMiecY74rK10kv2RNJWSilGmg2VeCXx5S0lyM
IdTyyYncEqqvRBR6sm87CjYqfhkLa1G3qhqEFvkxbhtUROjOsxhYyoxyoZ02FV80tWdNZkrmR304
wIsnFMBLoVGrbZLr/ndVURKH3aeoFgizvm/Ia1AmiWMKPVnqdziN06qoVA9QI6l31fTveNTzSBPc
806qM3dZq2j5REmah7qrBsdhnPKvNv0XfX2zff/xST66Pj/eX181h5ljkSmBiW8mDW1TLjVLZYZH
p7onxYFOT/D5x7PfCp68Uoe5AKsjszVD/5ahNTPtn2tYPmrr3Pyg9W1lI6+8g3Mc7RPTXa8pKVvu
yqsIvczIKinS2tK/fG2WeU+ZhE1VIDOV+HC/O+ZGB7njLaiTtu2dTuhdlOjEsrs1C1zdo2eUJVc3
uzzRvH4NtGn3kv30/Mf7x9/t58vT79O3DuO3+13L1hn5g92XiopWtlyz7oeSWsBW0mYzsw+KPpVd
dj845hrUnYxCgpBXGk17Gqknobkg5enCIjQPvrDrgfQEw6ohf4I78hm3vafIn7uNvsKIOnDWqaDE
92znO16wVG5ASDJfVAuTdu85qtFF5k9eZVQj64UaaDc1ZHUax3EXrovPGgRLVriB5/gO9DUtOLp9
w/cvfCTv1PVaQMKfpjMRkiAjS8AFNetF/iYX3jT5cKn5NyVqH1jdrCufIbzFEatqUhjViiuzp7v9
Cs33KkvD7ow8KRR6oF79U6nCtaXxASAVtb9cLCblJjK8It2jgXM0JcCJwfE4eTs+Yp6LiFORETmc
yToOnGlKwh0pkE5glrKnDqLQsyYw9GdaS/pGpdPnDip9I5N6li2I0mPrJEeuWbneonViZEWTZbov
jaTGGMgT0dHbAccuus4Plv6kCLvW+sUu646rfDPJh2vECbJeypGZMAqObci9K5JgqZ3eymHDjlEU
BmbbUfzLpfoYehyjwX8npak6zz5PlNlu7bmrMpl8lre+uy58dznT3j2PBz3YywGeeBHv9auiGz0W
XeZZ+djy9eXt93+4P91w9fCm2awEzlP78438TgPl9+Yfl33AT8ZMvaI9UTlpw/ahTWBQWymD4sj7
jCFM8hJjSJ1rOKfVg7qPkE3HVd5yf/EYP5lWQ8tJwYh78HRFSrj2zcZnCT3xDByTXmzKMd7E6+OP
34T/7u794+k3Y2kbW6H7eHl+ni53HV8uN9Jxrl7WHpAeUe1VGtgqvuJuK6RkamzbjGuiq4x15pDo
8Uv8jT8gTv5F8Jcs4TvMvHuwfAim+wFKszXj+sRJNKiQ18v3z8f/vJ5/3HxKoV266O78+evL6ydF
qH5/+/Xl+eYfJNvPx4/n8+dP6lZAl2HDdi3Fibkux4RxcSN36BpXzXZ5YqlOLczQO5uY+nhUsJid
EnmGJQnXofIVBZt9UHsHc90HrmWxvBDOkCf+jAdj9ePvf34nKQmfxj++n89Pvynvb+uM3e7VK2eS
cCLrBSvUIo7Iw67b8mLtupaB70a01u+06HhdFQWyAhps+7TuGlsmq11rg9Is6YrbGTQ7dvbScbyG
N6d1rpkcbrOHOrGBhfzQkjlZAK/m3da30kOTJZHuWDcWt1B6HUzvwqoBBHWcS0JN1/u0hNmk9OCC
fEtPPQpzaLVfD54Ula74sEsozJGyI2rvBVWzZ/SfTyUkAb7JPmST8E09NoQ60altVqzJANFOED5L
1hYqLW9dVqoGGqNi4wDeH4fo9mNKfDvUFIliXd2mi0UUO2BB6xFQYXLyxtokzykkgGLO6tzwVgS2
HOaWJFUf6desEQ6yaxF9XCHL8MACvIQ06clNJVpG8aYuAbmvI7NHyzb4hKOvK1cTyHk4qIfKoFVd
AWx7UaMSe3XC4j9Oddoc6CQvb+40Lt6WWQmButmrB1aHNacdONdaaS0iqgUVTLsq542HXM4JeHSt
paVyYuWKTZIaePkqVByzlB03Jevjx0AR6x+xMj1SYKkJP+TmO+J1kR1FuDgZn0ZPtuTjGGea804E
3IYrsCElQSHtd48T3FZtN4GlqYMcQP14//XzZvv39/PHPw83z3+ef3wqVthxFF5jHcq3abKHlXqk
x4delmrmNEmxenkfYam2iKkk/yU73a7+7TmLeIaNbyVUTmeSZZmTJ2OrbHuuvGUDkzK1SKxOish1
QW0I8LCZQ+VAt7sUXA9yfAFiF23cVDxERY3dGBa19CN4rbhnoPvsXE55xTdbJI1J0pKhTjw/nMdD
X+BGZ+CLXB47qKoCmKkq30PrcYZGeuuGJYoqdGFw4r6s8OO5luMMseVOpJJEDHemF4Zwod7QHOid
p7lyUMhqhGWVvMDkAJMjJC0OwCv6A16WvqfuYXr6ughcJH1GE25eud4J3UlSmPK8qU6gq+bUKXPP
uU1A6kl4pMeE2JQ+DOw6CWd7dHpHUaLNfHcc6U7Mc1Ubjo5VoMMICMfiMzjcMAU14mjBVrV4mjs/
Y3B1b27clymDDcKR2eJxfK+fowxyJMPzHbL39Axt4E2bL/aCaafkxGmXJOIJTAi38n+RT9tInYzm
JqJp96chP6EaGqlKPWVHSi8DLS5x3m4N3x9k0E1dxzZKlMyci//H5+Pzy9uzaa1gT0/n1/PH+x/n
T81ewbg664aeer+2Jy0c9YDT+F6m+fb4+v588/l+8+3l+eXz8ZU2GDxTM4coVl+9899erKc9l46a
0wD/5+Wf314+zk+km1vy7CJfz1QQ9IvHA3F4saEX51pm0jDx+P3xibO9PZ2/IIdoEWrX865+LPdY
Inf+T8Lt32+fv51/vGiHpCxdxvDsQQALNVdrciK93fnzr/eP34UQ/v6/88f/3uR/fD9/E2VM1Fop
WQdL33BH2Gf1xcT6DvrJOyz/8vzx/PeN6GbUjfNEzyuLYvMNydhDbQmIFJoz3/qSydTWTEomXut6
rgNzuZbMeCEADEVl4y7H7UncspsoyOzt28f7yzdVER5I0yRWFb6EOQQ66Y0/l16/vu+6B9JaT13V
Mb4d5FvElmKoTHBxO1TCvjeq2u2JfMWtqkozWex3Od9Et3zLicqyOnVrxfoof5/YpnS9cHHLl3g1
qR5dpSG9mkbra89BUfUWzmo3SVgAUQoSFYH4fHw5RmWJLJGgiYFCDbqhD1LvgxDOpS5ZrGF7Rxb4
wEljcCfVlgHGXUvBFjBEeM9QJykfVwvwacPiOJotbxumjscswTV7Btf1ULnarOZr+3zqW9d1sKI8
cLSp68XoCr3CIB+wo099Z0YugsGHRSckwG/PBxYZdn0mdc4QLw8gdYrcbtywm7AUbexB5yI9wz5x
Q3faSzhZc803kOuUs0cO6gP3wvpdddhg0W++pRUcFGfAacpoKi3g5AANMdhnvjYudQ9kca4x85nm
MuRCrGo6FJkixr3XgUz3y0Hmh3zV0DnpXKWbPN1kfBrdPkyTFecnE6rxgHQs2j26tDeg/RUlk1rn
KKk9sxiUx6Zski1qjFVSyvCQ4322CyDiBx2SbX6HbdW7McoQxOt8YWoRPXLMC4p41Yr4DnhE5FmR
Urlt5q1ynVIAkoVHTsosYY6H8OLQqMn7bTaa2VRNXjq+U7YWvSc87fXbQJwEWhkA/Gx3QGUsKO3i
UlGwXXUcSwQ+rgq+1TtWbqTsh7bskJ2S4nZKoYhqfO3OtD1KScEciltjZ9JTQRhXqUS9vo/3pWRw
BV685vzr+eNMat83rmo+qycFedJqdkpKuq1ji/r1xdT/R0ls26ZKhYvy1llwVRlVtL8soLpe0UG+
hgYWabQJvParcagBLFUgD2g1t6TLwcBiYlJ4DPuMgiysSGTawgZsVboxPKRQeJI0ySIntKRA6NKy
rqtsLT1EPiXI3bTCRsGQyKytbd4MnAIUYAlusjLf4SGvcDFxIfwaV+uVdeteaQ6Kzsf/bzJFMSX6
XdXkyg0rIhWt63gx4+O4SPMNbKgjPV2yVM1YEhBLddwxfKqnMB0SdDtI7ftl7Zmn3GoD5Ee+xJH1
xxzJdIGg2lkKQF2N5bd8D9JBkRLOVwxy+pIeal1yw21QIz9aoCj+nD3DnuG0YR1a4QaeW/I/jeqa
U2RZlO00LN6EZdtAK3OP7tppHenyFMqsRToHgQ3vyCt6L2aZbLY5n07C5OA7DhxLAl9ahjWBwRJd
pNCZwtCxZU4ujHBn5mC0jJMDvmulMYaep2Qgjro4tVXjA3f7FWRWAGsxV1WrPYkqj4m+aop+UB7j
sjTbRlDRPakRrPVJQdDuhptd+dvz+e3lSfitn16l5dv9bJfzsmzQZSkVle4/0TGzweQFq7k0QryX
NdlgMHaTKVaErWJH13GsUKzfsx3ALtmT9KCKAGUIWpkePfJm1i7Qk2sfcdPNTB2rNuX528tjd/6d
8ro0kzpvkn2H3h5BbaPzaCOGR4ME+ZzKy3Nt+u5583JjMFtZD+Sc/6Gdz3ubr7+aXtZtZXJWjlVa
X82QLzBfzXDjp3MZuhb9TkCXslg5pCjnOH6uN1dlyNnK9SZZW86bTdbySpbXG42Ysl3ypS4TRtBT
tMETLS0lImi2yIJhVo6So86ucCTsWi7XBCOZpoKx10u02nx6X+usYbSMrEVfRlckyBlGCdqKwnn6
+n+lLIMYLFlGfLGcgS7jHJdG8Hxt2hCsUoZzySGrnsYT/z9r19LkOI6j/0oeZw6zrbflwxxkSbbV
KdlKUXa56uKoyXJ3OaIyszYfE1376xcgKZmgQGfOxh7qYQDi+wGQxAc/dJlkyEw4mJ2JzHsFkTLT
5fWK8HTeXxO2F3mn5HsjPfVZ5HhLJg0dfYwspea7h4iUuTonpcTVma8kWtRiutKlD1pi7xhdhnRW
1B9JcsO7IE/FP7aGK9H3muX9DkShj67haWw/IXEdkxBNxVBmPhyJldi3q+lZr5X1x6JrNqLPOvg7
D31oOzCCL00nw0SuCpGzrUmjZUrZLA4xAUOZU+QZUNmWVIEosT5tLgYUaaaXqZwoDnE8yUWeDTQF
HvBdSwHYBhxC1t4dV3l+TL2UHLojvWk0g1OsgZ+1MsCnca03UhPPROasdCYRQfYdqLxs6pmIpkit
WaqSnZHCQzsqepKw/p8De27ezl+o4ZyjUnQgpNeazmVRqM+Aa/j3XKg0GATSa03nj44hN9UbjuzG
UppIzsZXNlkJz3lqwiZhk7VwalHbHUsfEknNGSP0qDDxjjDaOMrqGKwXMj555ugrJzGworgqMqxu
ngMMcYx1C0u9TtUlqOp5TaKBhGz+hasuMCYlLxpd/ZSgQetxYyNUFbpdE4eJLL+TBXVJYB/0uw7v
8COPf8OJIneJADO1tWWs4k3LrAaDTR7qPmHoLlZ0UgvZL4rFFuAgC0AXRTG2ZcCjFV4yDAgqr25s
nwQ+0FX0GUn2c+odeZkZkwQU2U5ibCPfAqs0WI5qtU11hD/yuKio9tYWtV5aO9QtrteHnHNPkSfX
y2aIxdzoUpLDJqkhu05Ou3JTIkwxObQqm3I/OU/svmT8NbZkzsQ8YHE3JTfNZmEW0UyQOIs8jjjN
W5L5e78LnzVUR651ojjSr9VKCizeE8gdz29HgfKdFGZ8HK8Ln7VvBu6cr9jc2eWSGzANP+e6aD45
PVdkdpsz2D6XVhJzVEfXzPnbpZE95wbP3FXezJkYsJKVF05HHTBmKy9yvJxHZW4N49qZbp6h0+Tq
SF+ODpxVuQmQzbNCzaIFQuZOLOA7ibQiSl5nVdN1FXAIF8akl4WDTbCzikC4fctzYd1KWKVboyyZ
ZRdhnkSjT759aDoIxe0eYyTzN8rl4fNmK44hohVfTUYLRtfTid3pTEWTj2UZR++VPo6Cj+aadU0S
fShbPJQQsuVz8zZCc4GOXoO0MwJaUq4zpFDgqI7kRuF7VZGjoVpWe9cNWrXpyxrBKfGpoHVvYrKm
U5OweWB8DHnvKD6yRI6xhJxlv8iE2fUKIkwNnwRyjnnOez4ZM6ZHHwCX/YkCA+iOoxnrVYP3IJcG
1OF89/mOnaFfPm/umtZskfUn0VYbFnFGGeri6e0ZH07Yd03SQ53gXylK220XJelR0eXD1a8mDo+B
5BfWKyF5sXrF/32IaH1FoloplJqpzCDxCSzhxTT7Zd83nQczxJ14dWhxPXOlLBGhkmnK20/1lUS7
4lqNYTRFTH0v3Lg6rsWQ5dAZKja7XY59L2MduzPbtHkzu1JBxJnc5OWx7/Np6plo5rhmupPXw6FY
HLAYbZc3jjlSt2Lm+0w5Lnb3QThLuYFB3ZXTAuLisZIv8mAAuOuoCtlWGONjTZ40KI7omzAAzfvC
gEV7P2ukm7CFIZX1DbrUVvx7OsUVPHPITW2rzscc8vVL31xpKvnG49i1TINdmrO/fa9BfkfbG6tC
ltS1nvh54/BBHwSafhfww18rFlto1+tJ9I7hUuraY+yVa03ZHnjPpnUa4qxoOs5TbGRKFzH7m5bz
AVaFqRAZ7jPsxH1n7WJqEMEI4gN3ZH0OrexzE3UcyPqeezrCFQPy3TqG1SBi8YdxgMCkMOpb7Ogk
Urf/5OjW2hHGD7OqXmwJjh42QAM0JpvRI7lZ78g0ymAtDHEF6j7BmG6sFKFot7JwjmSzui9h3dOf
0ZIp3EET63BbZ91SukBItHQp5TqelYe7VZvb21Vb5JPCXAauXCjgKxalD2Zc3hR3k0rCbE8qUMBX
zmRRRXFmKovryFM6rUNdyFs4RWRwI7VfzMPT6+nn89P9VAnoSkT91A+eJrRjXpT76cONfbuDtQi/
eTCbQuSt6YXEZKuK8/Ph5U+mJPrlrPnzaEKGKMolI0JWlwkU7dXmIME8YFF85ebOXnTQko779Xa3
KdDv5p/aJw+m0+O3T+fn001x+vf5/kRuVUZpWZBJ38C4vfmb+PXyenq42T7e5N/PP/+O4B335z/O
9wYsoPIa0tcs4inn4AoRyjLPNvuMolIqunyqkokd+wJ/gNDEaVRtlsZ+eQHIHDkXjyWmOKqc6qUl
W0zFw4UTV1XjOshgiM12a/Sw5rRBNnxi6CuSpQvHdiJTmDHhfu7LlYOC0o9ksewmHbZ4fvr67f7p
waqduaJIzVi6GXDa3jZXqIYm+J0kgioleuO0QUtphwWTfGwbsqqzZVK+fof2t+Xz6fRy//XH6ebu
6bm6cxX8blfl+bHcrKoNN0SKNsvQppS4ReY0fy8LhQz1X82BHw+y+fGFnFmhibh6Ogea+19/ucqv
9fq7ZnVV79+0JTtMmMRl6uUjQlrd1OfXkyrS4u38AyGtxkk6xcOs+tLEDMSfsp5A6LttXesNX+f8
8Rw0jOjlnpdrh2FTcuxXsKBnrbHYIw3mTpep5zAGVZ5yf+pohEK9/LrurpHNPGgbsD64osuy3719
/QED2J5V5n6IRnC2KcDysM7ccU86itKmioXxWFSS6jrPLRK9rh1JbTElTmj6Ntiifso3Qqh1ypgk
bP3MTSIfdGim20aVadUZxvpIrbbFFlSfDbnI2OZXINNlXBM0owLvuN/WfbZCRLJdW1NNdBQLJ2K8
UoPyvPa+k9aiWmonS+rh/OP8OJ3Xuuk47oh69aHdc9RYGxz9y668G3Zu/fNm9QSCj0/mmNOs42q7
H2KlbDdFiUPw0gemUFt2qA5nYFubjUhEcCUXGXumZsohrqJos7x05JQJUe1LuxITDGHQxYejRO05
Jev+YPJRwTeZpiKvjyAm313a8Vjuy00/LaUkD3lvtnn7jkjbNrtL+lRkHOfF0pjQ5aHPL8CD5V+v
90+PWv3iEMaV+DEDVf/3LOdPZKXEUmTzKCV3GpqDnnzu75rs4EcxDdV0YYVhzD89uIjMZmnEPey6
SFA0U01v+01sXWJqjlqj8LoS0Ymu5d716XwWcm/+tYBo4tgL7MaXWPXav9FOElj54Nx2LWsp18Pf
lk/1qH02284EV1SHLUWXUcx7RS8X/OKjNStQYZasx2PvH2tQbXpDGcVj3bKhyOdAQxKTgsSCX7W0
TCPxGrT9Hlg43hcsFDCeC+GJzabsj/nS8OcFerUkuann98dN2fDtLfdt1n+tyFJQi4qiIw0wnOh0
bW6FEJYG8bLJA2d7D8ddDWe/qjWFNtWwF7kKP2xCpTtFP4iQbR2f4p1UiYj52cLEKTR5xnsn070W
fiD019LUvC+0Y77gRBFx0EVXijXLRbx10Kt3jemXjPxbdIdFKUrWuKNg9+gSEq7671Kw39DKDLkK
3LxGkcAUEZ+OChiSJgfkQdxRNLUzPHwMmoZ43w9E7uI8Kw51SB+waJIdQ9fiWqgwQJwFEwIrRf18
F01G3hTB74AGWQZKxPo3LZocVmoJEFubCVyodlYGh5Rs0VRemk5TulBtt/AiC9gL+SILTfwAGKdd
4SU2gTiLSRL7XGR5qAXGzczIgnGhOrrIECC1NCLBqDqFhTUI+4GBvuMOHoZnucZHwOqBf3m1cxAF
N/xuD/nvtz4JXtDkYRAaAwKMlFlEn0ppkqP6A5fUHYnWezQgpRGLpw+ceRz7Rx0rhFKtJIDEaRnN
IYdBa0beOORJQEKp5llIQwoDIaRge6K/TUMWURA5iyz+f8ObApV81aBqClaJOWNn3tzvYkJRITCN
5WLmz/lbDIStSrj3wcgwY6jK34H1OyW/o1li5Zp4CWzaoNQjaGtW1473H0TSFUMcgaYSHjFFstIj
/2oJmew6gAyrhrN5aNUgTXmMdmDNA25UISOaW6nM5+yxfzGPkplZgEp6WYPGPjkIpDQ8rFMU6wAv
a7K4CJDHl/rQBt7BZhtMXEvNnPDgTboGU3Keo3ejT4lFNse1e9VaJSs3+7LetiWM3L7MeVyR4W2I
mR5eldYdmi9WgusKzAbu8dz6QEJcV5ssOBxoosNxvpUkmISzwtEudZv7qZ0OEMNJ4nWfBxGNlSxJ
KW8ISd6cH9KKx489tLu8gHMBQo5PgporSkoJgYmyhIQwCQlhThB2mrwFU+VAVlUgRQG/pCBvzqIJ
DH6jMupL4lndbTDBqERMaou/OX7x7QGqzupF1hHqJtvBnDdWK3wgYPf5xVisXPPlIrJ/XwQkuEGp
Xsh97rZ2/t0m7hM/dYy68QjArpuOnEFpbQmZUJIczsdmW4xBT8Z9Ca0ZZNLNc6RPTZ9iKd+Rbzse
PtsU4msjnwzlXuobJRxoZiSegRYJz4x7o8h+4IckLJImeyniTfBWlP4wFR6rRmh+4oskSCZJQ7Js
mGbFnM3pGYSipqHj/aVmJyl3W6+zkyFtmGKEfuk5PuvrPIoj2lY9jBEvMlTa/TLxremm31wdhv7+
T0Erl89Pj6835eM305MflMyuBCWJ3pZMv9A3ez9/nP84W1pOGiZGwddNHukY1eMF3PjV/wGq0qfq
2AehKvPvp4fzPaJKnh5fnixYxb7OwJZca7Wd21elRPllO4nquGjKhBpW+Nu2iCTNsm3yXKQ+r+9U
2Z1zoraNmHkeG0A9L0LPXhAkjZRGkUbsxcsKgCF3uwqX4lUb8k4EwjQZ5E8bE0wRVeps+fdfUjvs
0NCTdhepcNznb5ogkSvzp4eHp0cSmHuwttTRAA3BZbEvxv8l3iWbvjkdGqGTGADQRkRbCa1kDigD
YpPw1J25aIec7FpI0060Yz6qGrbtNwqoyKOX64RJwpbJSIvP84gdZ/H0mNKYr2qCwVz7qhYFfp7G
XmJ4cMHvkNqFSHHo9HEUEJ0+jqLE+j0nv+N5gLGEzMs0TbUIoUXwaBGTIOrsw5SYoG6p31OZeUIb
F2iz2DrvAQq3ASAjofWdJZH9qcPAAy3Lo3Wy7aGQAiinBF69aLc9gsiTgxIRRQ7k/kGNhi84JbuH
XZh2MqrACYv+2yRBGBKsbtBZY9+pLcdpwK+VoKoiWAyXBXDmgaGZaB0nyxmStW72Cls/DTA+nbWb
AyOOZ5xyrJgzcjalaYlvFETt5UO7j+jHVybWuOR8e3t4+KVvFK31Q932yVg7xC6yeOqIk78Hn8iq
k1r+5YFdGhWe7Pn032+nx/tfI3zz/2Bct6IQv7V1PbwIUu/5VoiI/PX16fm34vzy+nz+1xsiWVvg
0XHAIzhfTUKm0X7/+nL6Rw1ip2839dPTz5u/QRH+fvPHWMQXo4g02yVYp7yLleTNfLZM/2mOw3fv
NBpZd//89fz0cv/08wRZDxvPWDQ8gfZMdUSR/JAhWQc98vCadbDKikMngrm1egMtcjTRoln5bErL
QyYCsG3NlfJCoyuoQXcdr0qLzDxdbdpd6Jk+k5rAbnzqa/aIVbLcJ7CSbR7ADux+FQaex03qaa8p
5eb09cfrd0OFGKjPrzfd19fTTfP0eH611dVlGUUe75moeJxzCl7neva5AlICog1xWRtMs7SqrG8P
52/n11/MaGyCkHq0F+veofCu0QT0uAM24ARQSLb/17umKkgMwHUvAlN3UL9p92uapY2v+51jgxEV
6NusgzEwAtLbk8bQ0GmwiGOgy4fT15e359PDCWyoN2jcydSNPG86KSPHpJS8WWxP7IhaI5WfTH7b
1omkkUm2PGxFOjMHy0Cx9f2R7jrzvW0OCbdXVpv9scqbCNYcIxuTas1ak0OVVeDARE/kRKfX+oTF
XmOYEtaQ0LO9Fk1SCG5sXgTmhfAmy4Sms4vPwBuyHBHinEPFTAB7Wrp4PnDUywWwigZ6/vP7qzE9
jeH1O0ylkD3my4odHlDS4VjjcsG+fQdVzsuIbFuIecjeJ0rW3ByVmZiFgakzLdb+zFzG8bc5rHNQ
2vzUpwSqTQIlZA/3gZGYN0b4O4mNtFZtkLWeefKoKFBDzzOvtO9EAutIVpvhIQdDS9SwYZpntpRj
BgyXFAIrYN4gmqkb9LbbksPc30XmB+wVVtd2HglAPZRkEva772h46T30dpSTC0bYMmB7YbtVswzD
bLPNNLi9JmzbHoYEOVtvodgy2jk3CEXl+yG5zUEKD/bQ34ahb93qHXf7SrCmQZ+LMPIN408SzKv1
oZV66J3YPFqXhNQmmEYXEmZmWkCI4tCQ2InYTwNDcdnnmzry6OqvaA5M8n3Z1InHntIo1syYLvs6
8SnqyRfoCmh3XoulC4Z6vPv1z8fTq7ryZHb6W4olI3+bG9OtN5+T+a2eCDTZasMS2QcFkmEt0UCD
9YvXQo3Zgp+W/bYp+7I7hlwAjabJw1gFFqILtcyVVwOHkl5jM1riMLLWTR6nER3elOXYsmwpshkO
zK4JibJH6daJIOWR9D5nTbbO4B8Rh0TXYYeEGixvP17PP3+c/rJfuuNZ2o4/+yPfaK3p/sf5cTLk
uO6tNnldba51ryGsngUdu22fIQA03X2ZLM1eRT+uo3wt2w+76xBn++YfGFTn8RsY7o8napivO+1D
yL08QsfQrtu1Pc8eHD6vpKBErgj0GIgCA0s4vv8sloI7GeWrpnWKRzAUZBTyr49/vv2A//98ejnL
QFST5UFulNGx3ZKtxOiSfCd69ByTDvYY+513dfhIpsRU/vn0CvrTmXm+FQfm+lxgsMLwn9ZZVMSf
WyEnpXevQDDxvPI2Ils/EnwaqQVJsCM4Dq18YvD0bW1baY4KspWHrnslE6du2rnv2fEbHSmrr9Vx
yvPpBXVSZv1ftF7iNStzyW4Daofgb3tZlzT7xVe9ht2Lh7svWtBWuS2PKEalGVd33ZrHn1Xe+pYN
3Na+BbsmKa5HT4pJ3zy1dajSGAgipnfv8rdtOGkqH18DmeHMnud25Uwqa2UoDiltH0dmi6zbwEuM
D7+0GSjSyYRAkx+IlvUyGSEX++MRo41xNogI57aKY6oh5Ds9DJ/+Oj+gkY0Lwbfzi7r6Y9IegpQ0
t4tWKsxVU/WfOTsONXCq+1ZF1kkPqOPeWCiahR+YV90tRjgcf3VLjKNnGg6iW9KoReIw50cwMGKy
XcOXxhKCumCozLFRp4vD2jvYEQLfaZ2PxZsbl8lA2Kd+GH/OsXS8k6zaLU8PP/G8ll1G5D7hZbAT
liYWPd4hzFN7ea6aY78uu2arPHuuLwo6wcv39WHuJT57TCZZ1JbsG7AHufsXyZhZor7PPevpYZv1
iJEAv4PCqlXopzGPm8q13DgMPxnhvuGH2tKJwzkQpbMBf6U8cMEMWjBlR/74iozmZASkIMkx8ZRM
btmBwjb5Rvk7OL4ZgDnsr655ayC/bOdW1A2DqREsiEUK5HW12PMQBsitGs45TXEORhdrSjCzi4zO
Sz2Lxyq5Ug2qV42VkpodtPmHCzmR9xMGvm2jSUALiinlEjKesOSrLIuEfpiVGQtECepIAlT2YGUl
/UqKRuFGEE6bZ/MkjWmq7WEypowAIqBMOl5HoFzOhnqULO0e0rc7mt3wVMseCYwzIuW7sKYksw7S
vK0LuyLyqZfrm7YrrMncV5MEUOV3l0nbDG4BxPVxcqWXiaN0fVXmWWsXB6jrjg8Ch+x9hXEr+or2
ugIEGsyoqru7uf9+/jnAMxu7QncnO+biTAVTtjKWoW3Tkp+df3sklN8lekxW5VM3IZhrOebQ0tVo
ZEPebDuNbkZfMt8tNfS/zIbdE6IUbfHOcFI044gggynVOhWTFC9Gdnc3YndBnYvSAcUCSxCIir7k
UV6QvenBWmcg5TCLfNssqg37LViamxW+6Gzzte4IQ+nt8XP+PtkeAkZp2yy/PfLOZirGDg4ww0Wd
8LJ+TdEsbf5B+A7wXyUgEQ0i/iBOS8gNzVm6CUYCIev3dtOCY3w4Z5r43NlOUG0dq0/TpG55pFTF
rDOYnXfTj/TucqXeTb5ujxha98A+m1UydCMxiAqr/Zh1C3PZVQL42vdKxiNEljNbhZ2zFcJuJMlo
i3xaX0ekPM2sdCx0SrWBBDUZcfhs4hjCx2YM89VupHEer+pdaTMRUW8CtTcEnAoT837FYibK80tZ
U+vPN+LtXy/SF/2y6GJktw5WIYwN+oshHpsKNuFCsS97ATAGjQSdbLc9qyiB1BA6ziDl2ebYd9lG
5CXsqJ2droYmGrLldy8lF3sVZs9d/siiK9AYP8gkrqmxK02YIaxhlVVOPXIPq6s8WVAUOGabjER6
ZeQKFYKV1GNAUYFSrJ2VVYHdZD6OyqqIbJgKRWKRWIcS1pV08fDJRqi2IYyNCGS3FkRDwS86zCUz
XZpGMsnZKJFsvAc6ADTA37brlA8mw/zfyp5suY1c119x5emeqsyMLcux8+AHdjclMerNzW5Z8kuX
YiuJauKlZPucm/v1ByB74QJqcl/iCEBzBUEABEGK5XqchKVS0WnWLDKWriixgTTqhrJ690w13J40
sQbhak6YgdSryv9IL0UafknCcUPA3ZXgCXxIDmR8XqjJCXRBC/N2Va0nmOjQG+YOX4F+0U3xaN6r
JGjnlxfqfnvaSPSnO4vNnEm16VETrxH+CKpr41ABNKypM+Esng57pZL2EvMMJkE7ucrBPJMiYO+Z
VEfGCGl066xPs6w8R3hIcCAa63Z6hfkLPYZAaDOTThcBuJbeikPwIsmE1x7MSqP4TQbUdRR4avfF
iOuEU/oR0hQxT4u6o7HbqZQjf5V2qdxu8HEOfyL1FgqsNXGbrDA3GfVs6oj2RYuCo2yReSnbGc/q
wnK8WTQLqSY4VIJ0+abvCz4T4k6vM96YtR47Fmh+xVQ+Nm+0xgzauGm49Y+ZQNSvNaWIWXRqiVMM
YVPEUhzdCm3qxKemaP1NbUDVm5LHNq6zCJJSvz/g9rxDKx5WBIHa+3Qqum6bvbukDLCWAh8PFB5X
9em9XTmHuEG3OiImTJpzmxkHVCdg6bLZIj6ycGvtCDg7hybCEAXnZiScdoR2W2QtFtPTS0qiaVcA
IOBHWGTqTBSfp205obOcIpHOt3Fs+bDs08X0uCD6cjk54+2tuBt7oPxCnflmv0UP+nIpSn7udkpb
OUvOs4gB72SB7Bs+6bHGD143tfmGGHWkwmrtaehuY3WZrk2fvKVjG9ViWqWYUbIyMxN1wA9Uqy0b
yU641V3qejg87x+s05U8qQrhHKYNN7o0uXG8xig3ab7KuCFr1c/BwWwBldNAGG7EEVzERW249Lus
L3zWSO6W0hsQHDN5ehX3WF3c0HSNxNvGqiZqRGEv1fW510dvZlhRqOf6XqhMmNGvQSI6HRjgRW35
yHRBqPiGWtdVpVYrNIZbr/cO4kRVR3Kw/l5fK/DqGL0vfVJMryC7GflKwkDPSyPtSndjtR/BHorp
YB2YLqPCPjgwZQ/kq4plvddvcXvydtjeqzM+1+8Hg2FUX2d4ggdaQcSk6cgbEZjv2M4PDSh1iYEM
F8sww2kVcyM1pI9bgNStI86scrUMqBfkqiJ61Jfb+QnGyFn43WbzqvchkFPmErUsEIGpsg+XFeg5
zk0WD6X8/SN+qKEnlO6R/ECBoq11m+oSdWJQ2pl+B7SI+dQLFnaJMhYv1sWkK8TERpVI5saS6xo9
qzi/4yN2qLdrTYlxP8dyAKrCKz4XBf32osInM+p1E2t4stKf54DyXnMypW2T1gKauVbuIDeeikif
2+A98vnl54kVf9uB5dn0lH7oBwkCqeEQpZ5NMKO9iDYMmx/ItdJw0Ethx6bib5WsL1CfTEUGaGMF
AqBLnqnzURorr4L/5zz2VmQPx+2GcmibJKroAt/qs3QLiyachRLYCAm9BqggrjgP5KI3grQcGoui
j/SKlQNk5BXR8htOS3XMwH/TsCThZMTKkFW9BjUCtI26qaw9MPOytfehQHZWQn27a/9zd6IVGYMH
VwzjJWoOrI5JYqSZrwtAAlU8KwvfpDW1hw7QrlldVz64LKQAZo4tB3mPlDxuKjqqA0jOW/sYvAON
RYY/G0q2GjT1C5z+RoHTIwWqLHsObAlbfq2iDY1V8SVKLCsGf/s5+sZhz6IYxKjlsRYwNYCx+zCA
gZhMMTkQqCQyQzZtv1Q9gySTflEEJGrtoTrEfCYnTlujugoXlItUf0Evk0monrsi596oAIDWhx2O
HKYNU9i7zKFhbaRezipKMleiSHmLeJGbeYxBc8eMHxsXb7aP53G1KevgliXbFQ+sjZnMi1rMDF5M
BoAh1RRIpXWla2CagkTeNEVNKQoKrnM2jnZKUxczOQ1NnUbTk4fKpzN1Ma3c6oT5rZlhsIABStnG
kkYjDFg7ERVuBvDHSpFJkLD0loEGOivStLglaje+EXli5tk2MBmHoSnKTa8fx9v7HztD0OYc2al7
L8EwjTS4ZrU0BW+//A2OUCBNGeAZTYFu6GIOmvpRqnCC0J6iiL7g4KSCfPFD0SCD29M3QIPSzSAZ
WnptPheix02PYfIHWFR/JatE7V7j5jXyuSw+o5Oe5K8mmfXs1RdOF6iDbwv514zVf/E1/gv7vF3l
sG5qi+UyCd9ZjLlySfB3wmcMtENQQBJeMtBzp+eXFF7Afo+7cH39Yf/6fHV18fmPsw8UYVPPrkwR
5laqIUSx72/froYS87oXniag39ZG6YzQ6pZWNY4Nmz6nfN29PzyffKOGU21LTrwbgpZuDhUTiSex
ZuJYBcRRBYUINt+i8ooDJSpNKk6d8i95lZsj4LhH6qy0m6cAtNLg0Hg7as8yPJslbVyBbWq+eab+
jHtZ74DyB29UD2Ws9hh8QIpnphysWD7v9sXRmExoAEysYZPNHCKu9ikNGnfHHohuCcnmIhBltQhv
+IAq0yaIjnho04j6Bo6tCdcSg3AhS5GgdcuFPbM9TO/bSk4d+VJT6R2ELAWNVjApJQxOGsjb5ZAq
+/FYlSYd5s+NVSicX16I8waCO/3GqP9lekdnDzEISDNwqPnOWElDbbJOyNqm6m2ISL37ePcPY8Sz
iIOdRN0QGqekYvMME7h3eyUUen0+yOW1w9qZyGEN27xUZEdYtgzx5E2+nnpsCcBPoQ+qrh7TL4mQ
iMVLzLG80Xqn6Z5EdJG78BJ20Iq7vwe5v8TXhqINWCPXZ6eT6alPlqLth1xlX0/oCGC2jyGnI9KU
uAN6EQ8EtPNeU15NJ79Fh3xEEtpkRpuOd7cfJrLxhUd2rGnmWFD0dAuHBnx42H37uX3bffAKjrWL
M1yWesLK70BI/4O9YhVi8CbErrwqfKnbwYKK3kDQ+wb8T4+a3j2RYXv7JdwJ0iWfmipNaoyzr1Qh
utfKWtDK7A8HzOW5FQpu4y6pCDqL5OriNFDw1cUkWPBV4AkHh4hOvGQTfaIv2jpEdBYNh4g6cnVI
zkOd/TQNYi7Cw0Am0HJIPgc//3xO53i1iS4o37xTjpnR1MLYGYftll1SV1WQBGwX5MX2KjAkZ5Mg
0wDqzG4Lk7EQNqgv/4wGT+yye/A5DZ7S4Asa/MmdjB4RZtWego72tfpDRQdaBIHGnnkstizEVRt4
07ZHU091IjJjMW7LLHcLRUTMQUWjfLojQV7zpipcvlG4qmC1YLRraCDaVCJNj9YxZzw1D9wGeMXN
Kx89WECj8akhH5E3ovbBqvOC7n/dVEsh6ehHpEHzlbLYc4E8Pja5A7Q5XtxOxZ26940P2c+6dzk7
OlG0tzem3WR5u3UKx939+wFv1z2/4LVjwwhd8o2lwODvtuI3DV4Z9+yAcafllRRgeYG+CV9UoOdT
e2ddYSxeoiux0nIrI6rDkIbppk0WbQHVqF7btkq3KbYJWGAqrLiuRBw4vyD87B6S3PcXbMXhnyrh
ObQTfYno4WpZCkoo03b2QOkQHUG1MygANV37xBc6GSuaDCZ8wdOSfoW702zHAWAGh6cyu/7wc/v0
gAnmPuI/D8//efr4a/u4hV/bh5f908fX7bcdFLh/+Lh/ett9R5b4+PXl2wfNJcvd4Wn38+TH9vCw
UxdYR27pnsJ7fD78Otk/7THXz/7/tl3au54P0fmP4e1LYNnc8uApFIYO4+gN/Qg4gHtiPBwN0g5P
3JFN6tHhHg05SN2VMfgkkEOLwaN5+PXy9nxy/3zYnTwfTn7sfr6YeQw1MXRvzsyjXws88eGcJSTQ
J5XLWJQL84DKQfifLMAuJIE+aWX68EcYSWgYDk7Dgy1hocYvy9KnXppnsn0JaDX4pCCD2Zwot4MH
P8DbgPhEUXdU5VLNZ2eTq6xJPUTepDTQUmM7eKn+Ul5gjVd/jB2n72pTL0A+etUome8SD68caWfj
+9ef+/s//t79OrlX/Pr9sH358ctj00oyr/jE5xUe+63gcbIwJfkIltShyYCuEqJOmVHjBrJtxScX
F2eWNqRDxd7ffmB6h3swFx9O+JPqJabR+M/+7ccJe319vt8rVLJ929pX6nXRMRUv1c96nHnjGy9g
B2ST07JIN11OKLdMxudCAr8EfHC6o/xGrI4Nz4KB0Fv1wiZSKUIfnx/MM5S+RVFMjdmMCv7ukbW/
QmLzhHZoRuTRpdUtUV1xrLpSN9EGrmtJlAPbPD54emzoWAJaVt0cmTeOrzP2S2Cxff0RGrnMTKDb
y8OMEY3FHriUK03Z5yrZvb75NVTx+cQvToG98tZrUkBHKVvySeSRa7g/aVB4fXaaiJkvxVT5Lv0R
Ts4SylobkBe+NBXAuOpuCcWTVZbQ2VT7RbFgZ75IgNV28YkCX5wRu+KCnXs9lNm5T1iDLhEV/i53
W16oBMdaWOxfflhBSsMS9/cIgLW1v9VHaXE7E+S8akSf6d1jEpZxMGmYP8EMFfE+Pby38AFLOWAM
9CevSOsyRQebqb9BAeiPMq9K67bTMPpTf+u6LdSYuLQdfOydnoXnxxdMyGLplkPLlRfTF1N3BTE4
V1PKXTN84jdUuW09aOfC1zlIQL9+fjzJ3x+/7g59FmeqpSyXoo3Lyky00neiitSTMo1Xk8KQIklj
tMBwu6lwMXnoYVB4RX4Rdc3xxlplmSyGotjHzJga8M/918MWNO7D8/vb/okQs5jIk1owKsGnFmL9
jUxiygyqI1MHRJoxh5Ko2jQJjRp0jOMlDGQkOgl0s5exoGjhKczZMZJxKMJEJJJQTXyigDhdUJt6
wldon92KnL4fb5B1914oswHR8qIkplaVr7K1MPKehUdWazkVLgd69zvlOAmsPDzoub9TDI7l6dQX
0EhxE/syqYOHTbeBgGDSHkeaiD2S58qIYWkamE6DqG/FMV3L/WRBx3YHWgEtPT6Mqq+3mC6oTXl+
DRsvSYTPv1NSE5Aim9c8pi1bxHeRzCzINzqW6p96JdmMr2NOncwYVHEMOgXZDHXfVXJCiiMzZWkx
F3E7X6dkHw28G2NpNXHSpIFO9teGilgqNQW25H/qsfnJIqa8vkxusoyjo0055/BOnRE5MSLLJko7
GtlEQbK6zCyaYSTWF6ef25jDNM1EjAeWbmBuuYzlVVtWYoVYLKOjMBIPZiQcv7zsojboci91pkz4
2HLPiTm68Equwx4wOFG1zQlg1Lsk5sH+pgzU15Nvz4eT1/33J5396v7H7v7v/dN3IwYeH0jDo3rl
8Lz+cA8fv/6FXwBZC2b8ny+7x+GwTke6mD7Vyoq99PHy+oNxqNrh+bqumDnCIddokSes2rj1USEI
umDYtuMlRswFmzZSKO0C/4cttIkqvir04GoCtxADP3axD3H7jdHvi4tEjt0DRsrr2fWQczyk3aQi
x3fuVHCRebrOnAjYSICpASxi3q/qE1CAFZLH6AOu1J1fk/tMEhCOPXZcq0WVkOcd0P6Mt3mTRVCn
EVKhRoilfg1lLNzI9h7lgGUNsrR7jdqQQTFIPlAdLdDZJ5vCN0mh9Lpp7a/OJ87P8XDDkmwKA1KF
Rxvq4MQimNpbocKw6jbE55oCJo0u13wKCn5aFkNsHJeDruUb/7FxuDlY+2P8OcuTIjP6TEV4ow4H
Srht89xp3dOB0uEqCNWRUy7cil8ZoUbYigU3SxlbYgalOGCKfn2HYPd3u7765MHUJdPSpxXMPEbv
gKzKKFi9gGXhITDxgF9uFH/xYPYx29ihNroTpje6Xz/E2RCTsogFLMYVaEhVxayzIXXFxLykiiB8
0348tcT3dwHS4mVjPCYyJjxRDzLHKVORMgtlyhkVV/FClSc3eaxoZ0MSabsMhoka3KhXC9FKSuz3
zYp4HoPNWhmRWXKe6sEwxigtIvsXcZI5DGRdZCI2JzpO79qaWXF7mM4LjB9KS8tKoYP8xuU5S4x6
CpGoS3MgbTdmq4E3UlFbkLIoDCGqTrcSXha1A9M7GghpENuTIdRMgmCxRGqJqUosP04RfWFzJ4J0
SCTrbEYjU+VneIZaJONlu+Gkq9cxFPTlsH96+1vnVH3cvX73z3/V/rdUN7yMZmpgzLrEZGZPQXsA
PT5qBOaHM20THazVgvaawgaYDudEl0GKm0bw+no6zFqnmXklTA2+3OQMWCMYeGXh9Y1SU5PbZFGB
6imvKqCj03UHx2zwTu1/7v542z92SsWrIr3X8IM/wrMKampvWZWrOETz2LcSYKxIvJaekUfQYFJx
fHsjh5E3T566VcljpQZlQmasjg2TyMWo2tsiTzeOgLhled01sCzUbUD7MpGJIQfrt4dDDZ7yl+3v
e2ZNdl/fv3/HY1nx9Pp2eMdXY6wbDhlDSwgUPzv1njUKdhxzD1Pi5xb/Jbf9gQwPAhVlhrcjj1TS
FdgdbHfIJpLMdOUq01RD2wgKTKRDG4DizIyoMSZRIeVCzKiWaWwiwOzlVeEW2eQVRwdRlLrthYpM
kaZhHDTIEaasIN25MeM2xkOAjQTEuA+KPmVhxwi/NbXuBOD9A9vMNuMMhjIMaYXyASwYfPK1sBPx
KpuuELLIA1ZK2kRdtab7XYGdK0iaCnZmvMiG0QjmDr3i/fJDaYiXoGbAGB4T3BYVGgbAMDBiohZ3
sP8nyRAubIcvjD3Vx0v486R4fnn9eIKP8r2/6EW12D59N0U3w4SbsMyLorRMEgOMd1wbwwWpkSjt
i6a+PrUmHKOrGysDyPGG6MgiWPQP77jSzekawysItD3M2JYl56W2orQVhsefIwf9z+vL/gmPRKEV
j+9vu//dwX92b/d//vnnvwwDDe8qqiLxSoZ/2ewW1nhT87VtY/Rb7f+jRrv5oIWAIj6X1C5p8qeS
wCBDYGFKUOpArdMGgMf8esz/1svoYfu2PcH1c49GrCUbNSO3CasZ7nN4i9u7UWlNY6BIfawRN9Ry
w2Rrcdm0avsZuGZyNhZtfziwE/TenoRxS1EjQ/scGGaqpMOzdYgX6q+wLL0xe37ZPR32r/dWH0y1
qN69vuHEIvPGz//eHbbfjcdO1LVls5H6HrOaYDI2bLznPMpHDeNr1QkSp8bQvhvdCQsQEXGxarVq
ZRo9FWxKaN/jZzig3anR0NB0mdTU0bhez+hpkTj+5o18xGQiR+WCCh9X+O4jEwT7jP24b4WmCehz
BaboDNivvR5P2vWq2AVfJ01GRwDgnCMThe1j3VhNpqPmpNNsQMq43DjQJYDrYu1seJ0ryCkgZrkL
67R6G9g0pjasQGtt8dl0/o6hwBUaELXarm16+xRfgUTCvIHUlkWQFZaZ9wX0gr7arbCrTBtw7lfo
mGoxkpH4cCbyBIs1TEK74TNRZSAIudN3904jFDETHOwLb2HC/qkz3IwrkHZIQnnkKtX+SRJh+Pfc
YKssQbT5ndlW6YCUSmHVYTh9tFsu0H5nqBOeMmqcO85WQaNdaK21unkWM+AId5Rr5asUhDjgeB0s
uMBUHCbqV5bqckyyDnsubnpghOA9wDYp4gYvqEl/W4wEWmRFJcntyzFt/wvIceTPwkUCAA==
--===============1146001107552109963==--

