Content-Type: multipart/mixed; boundary="===============6149790616859024286=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] exfat: remove 'rwoffset' in exfat_inode_info
Date: Wed, 09 Sep 2020 23:28:22 +0800
Message-ID: <202009092358.1IYJ0gPE%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6149790616859024286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200909075652.11203-1-kohada.t2@gmail.com>
References: <20200909075652.11203-1-kohada.t2@gmail.com>
TO: Tetsuhiro Kohada <kohada.t2@gmail.com>
TO: kohada.t2(a)gmail.com
CC: kohada.tetsuhiro(a)dc.mitsubishielectric.co.jp
CC: mori.takahiro(a)ab.mitsubishielectric.co.jp
CC: motai.hirotaka(a)aj.mitsubishielectric.co.jp
CC: Namjae Jeon <namjae.jeon@samsung.com>
CC: Sungjong Seo <sj1557.seo@samsung.com>
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Tetsuhiro,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.9-rc4 next-20200908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tetsuhiro-Kohada/exfat-rem=
ove-rwoffset-in-exfat_inode_info/20200909-155904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021-20200909 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/exfat/dir.c:165 exfat_readdir() warn: should '(++dentry) << 5' be a 64 b=
it type?
fs/exfat/dir.c:181 exfat_readdir() warn: should 'dentry << 5' be a 64 bit t=
ype?

Old smatch warnings:
fs/exfat/dir.c:160 exfat_readdir() warn: passing freed memory 'bh'
fs/exfat/dir.c:255 exfat_iterate() warn: should '1 << (sb->s_blocksize_bits=
)' be a 64 bit type?
fs/exfat/dir.c:479 exfat_init_dir_entry() warn: passing freed memory 'bh'
fs/exfat/dir.c:546 exfat_init_ext_entry() warn: passing freed memory 'bh'
fs/exfat/dir.c:555 exfat_init_ext_entry() warn: passing freed memory 'bh'

# https://github.com/0day-ci/linux/commit/6598a38edbb9fbc2616d284e472f8fb86=
1719c92
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Tetsuhiro-Kohada/exfat-remove-rwoffset-in-=
exfat_inode_info/20200909-155904
git checkout 6598a38edbb9fbc2616d284e472f8fb861719c92
vim +165 fs/exfat/dir.c

ca06197382bde0 Namjae Jeon      2020-03-02   60  =

ca06197382bde0 Namjae Jeon      2020-03-02   61  /* read a directory entry =
from the opened directory */
6598a38edbb9fb Tetsuhiro Kohada 2020-09-09   62  static int exfat_readdir(s=
truct inode *inode, loff_t *cpos, struct exfat_dir_entry *dir_entry)
ca06197382bde0 Namjae Jeon      2020-03-02   63  {
ca06197382bde0 Namjae Jeon      2020-03-02   64  	int i, dentries_per_clu, =
dentries_per_clu_bits =3D 0;
ca06197382bde0 Namjae Jeon      2020-03-02   65  	unsigned int type, clu_of=
fset;
ca06197382bde0 Namjae Jeon      2020-03-02   66  	sector_t sector;
ca06197382bde0 Namjae Jeon      2020-03-02   67  	struct exfat_chain dir, c=
lu;
ca06197382bde0 Namjae Jeon      2020-03-02   68  	struct exfat_uni_name uni=
_name;
ca06197382bde0 Namjae Jeon      2020-03-02   69  	struct exfat_dentry *ep;
ca06197382bde0 Namjae Jeon      2020-03-02   70  	struct super_block *sb =
=3D inode->i_sb;
ca06197382bde0 Namjae Jeon      2020-03-02   71  	struct exfat_sb_info *sbi=
 =3D EXFAT_SB(sb);
ca06197382bde0 Namjae Jeon      2020-03-02   72  	struct exfat_inode_info *=
ei =3D EXFAT_I(inode);
6598a38edbb9fb Tetsuhiro Kohada 2020-09-09   73  	unsigned int dentry =3D E=
XFAT_B_TO_DEN(*cpos) & 0xFFFFFFFF;
ca06197382bde0 Namjae Jeon      2020-03-02   74  	struct buffer_head *bh;
ca06197382bde0 Namjae Jeon      2020-03-02   75  =

ca06197382bde0 Namjae Jeon      2020-03-02   76  	/* check if the given fil=
e ID is opened */
ca06197382bde0 Namjae Jeon      2020-03-02   77  	if (ei->type !=3D TYPE_DI=
R)
ca06197382bde0 Namjae Jeon      2020-03-02   78  		return -EPERM;
ca06197382bde0 Namjae Jeon      2020-03-02   79  =

ca06197382bde0 Namjae Jeon      2020-03-02   80  	if (ei->entry =3D=3D -1)
ca06197382bde0 Namjae Jeon      2020-03-02   81  		exfat_chain_set(&dir, sb=
i->root_dir, 0, ALLOC_FAT_CHAIN);
ca06197382bde0 Namjae Jeon      2020-03-02   82  	else
ca06197382bde0 Namjae Jeon      2020-03-02   83  		exfat_chain_set(&dir, ei=
->start_clu,
ca06197382bde0 Namjae Jeon      2020-03-02   84  			EXFAT_B_TO_CLU(i_size_r=
ead(inode), sbi), ei->flags);
ca06197382bde0 Namjae Jeon      2020-03-02   85  =

ca06197382bde0 Namjae Jeon      2020-03-02   86  	dentries_per_clu =3D sbi-=
>dentries_per_clu;
ca06197382bde0 Namjae Jeon      2020-03-02   87  	dentries_per_clu_bits =3D=
 ilog2(dentries_per_clu);
ca06197382bde0 Namjae Jeon      2020-03-02   88  =

ca06197382bde0 Namjae Jeon      2020-03-02   89  	clu_offset =3D dentry >> =
dentries_per_clu_bits;
ca06197382bde0 Namjae Jeon      2020-03-02   90  	exfat_chain_dup(&clu, &di=
r);
ca06197382bde0 Namjae Jeon      2020-03-02   91  =

ca06197382bde0 Namjae Jeon      2020-03-02   92  	if (clu.flags =3D=3D ALLO=
C_NO_FAT_CHAIN) {
ca06197382bde0 Namjae Jeon      2020-03-02   93  		clu.dir +=3D clu_offset;
ca06197382bde0 Namjae Jeon      2020-03-02   94  		clu.size -=3D clu_offset;
ca06197382bde0 Namjae Jeon      2020-03-02   95  	} else {
ca06197382bde0 Namjae Jeon      2020-03-02   96  		/* hint_information */
ca06197382bde0 Namjae Jeon      2020-03-02   97  		if (clu_offset > 0 && ei=
->hint_bmap.off !=3D EXFAT_EOF_CLUSTER &&
ca06197382bde0 Namjae Jeon      2020-03-02   98  		    ei->hint_bmap.off > =
0 && clu_offset >=3D ei->hint_bmap.off) {
ca06197382bde0 Namjae Jeon      2020-03-02   99  			clu_offset -=3D ei->hin=
t_bmap.off;
ca06197382bde0 Namjae Jeon      2020-03-02  100  			clu.dir =3D ei->hint_bm=
ap.clu;
ca06197382bde0 Namjae Jeon      2020-03-02  101  		}
ca06197382bde0 Namjae Jeon      2020-03-02  102  =

ca06197382bde0 Namjae Jeon      2020-03-02  103  		while (clu_offset > 0) {
ca06197382bde0 Namjae Jeon      2020-03-02  104  			if (exfat_get_next_clus=
ter(sb, &(clu.dir)))
ca06197382bde0 Namjae Jeon      2020-03-02  105  				return -EIO;
ca06197382bde0 Namjae Jeon      2020-03-02  106  =

ca06197382bde0 Namjae Jeon      2020-03-02  107  			clu_offset--;
ca06197382bde0 Namjae Jeon      2020-03-02  108  		}
ca06197382bde0 Namjae Jeon      2020-03-02  109  	}
ca06197382bde0 Namjae Jeon      2020-03-02  110  =

ca06197382bde0 Namjae Jeon      2020-03-02  111  	while (clu.dir !=3D EXFAT=
_EOF_CLUSTER) {
ca06197382bde0 Namjae Jeon      2020-03-02  112  		i =3D dentry & (dentries=
_per_clu - 1);
ca06197382bde0 Namjae Jeon      2020-03-02  113  =

ca06197382bde0 Namjae Jeon      2020-03-02  114  		for ( ; i < dentries_per=
_clu; i++, dentry++) {
ca06197382bde0 Namjae Jeon      2020-03-02  115  			ep =3D exfat_get_dentry=
(sb, &clu, i, &bh, &sector);
ca06197382bde0 Namjae Jeon      2020-03-02  116  			if (!ep)
ca06197382bde0 Namjae Jeon      2020-03-02  117  				return -EIO;
ca06197382bde0 Namjae Jeon      2020-03-02  118  =

ca06197382bde0 Namjae Jeon      2020-03-02  119  			type =3D exfat_get_entr=
y_type(ep);
ca06197382bde0 Namjae Jeon      2020-03-02  120  			if (type =3D=3D TYPE_UN=
USED) {
ca06197382bde0 Namjae Jeon      2020-03-02  121  				brelse(bh);
ca06197382bde0 Namjae Jeon      2020-03-02  122  				break;
ca06197382bde0 Namjae Jeon      2020-03-02  123  			}
ca06197382bde0 Namjae Jeon      2020-03-02  124  =

ca06197382bde0 Namjae Jeon      2020-03-02  125  			if (type !=3D TYPE_FILE=
 && type !=3D TYPE_DIR) {
ca06197382bde0 Namjae Jeon      2020-03-02  126  				brelse(bh);
ca06197382bde0 Namjae Jeon      2020-03-02  127  				continue;
ca06197382bde0 Namjae Jeon      2020-03-02  128  			}
ca06197382bde0 Namjae Jeon      2020-03-02  129  =

ca06197382bde0 Namjae Jeon      2020-03-02  130  			dir_entry->attr =3D le1=
6_to_cpu(ep->dentry.file.attr);
ca06197382bde0 Namjae Jeon      2020-03-02  131  			exfat_get_entry_time(sb=
i, &dir_entry->crtime,
ca06197382bde0 Namjae Jeon      2020-03-02  132  					ep->dentry.file.creat=
e_tz,
ca06197382bde0 Namjae Jeon      2020-03-02  133  					ep->dentry.file.creat=
e_time,
ca06197382bde0 Namjae Jeon      2020-03-02  134  					ep->dentry.file.creat=
e_date,
ed0f84d30ba65f Tetsuhiro Kohada 2020-04-22  135  					ep->dentry.file.creat=
e_time_cs);
ca06197382bde0 Namjae Jeon      2020-03-02  136  			exfat_get_entry_time(sb=
i, &dir_entry->mtime,
ca06197382bde0 Namjae Jeon      2020-03-02  137  					ep->dentry.file.modif=
y_tz,
ca06197382bde0 Namjae Jeon      2020-03-02  138  					ep->dentry.file.modif=
y_time,
ca06197382bde0 Namjae Jeon      2020-03-02  139  					ep->dentry.file.modif=
y_date,
ed0f84d30ba65f Tetsuhiro Kohada 2020-04-22  140  					ep->dentry.file.modif=
y_time_cs);
ca06197382bde0 Namjae Jeon      2020-03-02  141  			exfat_get_entry_time(sb=
i, &dir_entry->atime,
ca06197382bde0 Namjae Jeon      2020-03-02  142  					ep->dentry.file.acces=
s_tz,
ca06197382bde0 Namjae Jeon      2020-03-02  143  					ep->dentry.file.acces=
s_time,
ca06197382bde0 Namjae Jeon      2020-03-02  144  					ep->dentry.file.acces=
s_date,
ca06197382bde0 Namjae Jeon      2020-03-02  145  					0);
ca06197382bde0 Namjae Jeon      2020-03-02  146  =

ca06197382bde0 Namjae Jeon      2020-03-02  147  			*uni_name.name =3D 0x0;
ca06197382bde0 Namjae Jeon      2020-03-02  148  			exfat_get_uniname_from_=
ext_entry(sb, &dir, dentry,
ca06197382bde0 Namjae Jeon      2020-03-02  149  				uni_name.name);
ca06197382bde0 Namjae Jeon      2020-03-02  150  			exfat_utf16_to_nls(sb, =
&uni_name,
ca06197382bde0 Namjae Jeon      2020-03-02  151  				dir_entry->namebuf.lfn,
ca06197382bde0 Namjae Jeon      2020-03-02  152  				dir_entry->namebuf.lfn=
buf_len);
ca06197382bde0 Namjae Jeon      2020-03-02  153  			brelse(bh);
ca06197382bde0 Namjae Jeon      2020-03-02  154  =

ca06197382bde0 Namjae Jeon      2020-03-02  155  			ep =3D exfat_get_dentry=
(sb, &clu, i + 1, &bh, NULL);
ca06197382bde0 Namjae Jeon      2020-03-02  156  			if (!ep)
ca06197382bde0 Namjae Jeon      2020-03-02  157  				return -EIO;
ca06197382bde0 Namjae Jeon      2020-03-02  158  			dir_entry->size =3D
ca06197382bde0 Namjae Jeon      2020-03-02  159  				le64_to_cpu(ep->dentry=
.stream.valid_size);
ca06197382bde0 Namjae Jeon      2020-03-02  160  			brelse(bh);
ca06197382bde0 Namjae Jeon      2020-03-02  161  =

ca06197382bde0 Namjae Jeon      2020-03-02  162  			ei->hint_bmap.off =3D d=
entry >> dentries_per_clu_bits;
ca06197382bde0 Namjae Jeon      2020-03-02  163  			ei->hint_bmap.clu =3D c=
lu.dir;
ca06197382bde0 Namjae Jeon      2020-03-02  164  =

6598a38edbb9fb Tetsuhiro Kohada 2020-09-09 @165  			*cpos =3D EXFAT_DEN_TO_=
B(++dentry);
ca06197382bde0 Namjae Jeon      2020-03-02  166  			return 0;
ca06197382bde0 Namjae Jeon      2020-03-02  167  		}
ca06197382bde0 Namjae Jeon      2020-03-02  168  =

ca06197382bde0 Namjae Jeon      2020-03-02  169  		if (clu.flags =3D=3D ALL=
OC_NO_FAT_CHAIN) {
ca06197382bde0 Namjae Jeon      2020-03-02  170  			if (--clu.size > 0)
ca06197382bde0 Namjae Jeon      2020-03-02  171  				clu.dir++;
ca06197382bde0 Namjae Jeon      2020-03-02  172  			else
ca06197382bde0 Namjae Jeon      2020-03-02  173  				clu.dir =3D EXFAT_EOF_=
CLUSTER;
ca06197382bde0 Namjae Jeon      2020-03-02  174  		} else {
ca06197382bde0 Namjae Jeon      2020-03-02  175  			if (exfat_get_next_clus=
ter(sb, &(clu.dir)))
ca06197382bde0 Namjae Jeon      2020-03-02  176  				return -EIO;
ca06197382bde0 Namjae Jeon      2020-03-02  177  		}
ca06197382bde0 Namjae Jeon      2020-03-02  178  	}
ca06197382bde0 Namjae Jeon      2020-03-02  179  =

ca06197382bde0 Namjae Jeon      2020-03-02  180  	dir_entry->namebuf.lfn[0]=
 =3D '\0';
6598a38edbb9fb Tetsuhiro Kohada 2020-09-09 @181  	*cpos =3D EXFAT_DEN_TO_B(=
dentry);
ca06197382bde0 Namjae Jeon      2020-03-02  182  	return 0;
ca06197382bde0 Namjae Jeon      2020-03-02  183  }
ca06197382bde0 Namjae Jeon      2020-03-02  184  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6149790616859024286==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6149790616859024286==--

