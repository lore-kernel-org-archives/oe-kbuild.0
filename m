Content-Type: multipart/mixed; boundary="===============3546467497555344943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 RESEND #2 2/2] block: add overflow checks for Amiga partition support
Date: Tue, 23 Aug 2022 11:18:46 +0800
Message-ID: <202208231120.mc0KIFjI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3546467497555344943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: block/par=
titions/amiga.c:88:3: warning: %d in format string (no. 1) requires 'int' b=
ut the argument type is 'unsigned int'. [invalidPrintfArgType_sint]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220822211236.9023-3-schmitzmic@gmail.com>
References: <20220822211236.9023-3-schmitzmic@gmail.com>
TO: Michael Schmitz <schmitzmic@gmail.com>
TO: linux-block(a)vger.kernel.org
TO: axboe(a)kernel.dk
CC: linux-m68k(a)vger.kernel.org
CC: geert(a)linux-m68k.org
CC: hch(a)lst.de
CC: Michael Schmitz <schmitzmic@gmail.com>
CC: stable(a)vger.kernel.org

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.0-rc2 next-20220822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Schmitz/Amig=
a-RDB-partition-support-fixes/20220823-051457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6b86551e8891f07839a8c3ad19e3f770b0f738e9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


vim +88 block/partitions/amiga.c

^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  35  =

1493bf217f7f59 fs/partitions/amiga.c    Tejun Heo         2010-05-15  36  i=
nt amiga_partition(struct parsed_partitions *state)
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  37  {
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  38  	=
Sector sect;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  39  	=
unsigned char *data;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  40  	=
struct RigidDiskBlock *rdb;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  41  	=
struct PartitionBlock *pb;
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  42  	=
u64 start_sect, nr_sects;
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  43  	=
sector_t blk, end_sect;
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  44  	=
u32 cylblk;		/* rdb_CylBlocks =3D nr_heads*sect_per_track */
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  45  	=
u32 nr_hd, nr_sect, lo_cyl, hi_cyl;
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  46  	=
int part, res =3D 0;
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  47  	=
unsigned int blksize =3D 1;	/* Multiplier for disk block size */
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  48  	=
int slot =3D 1;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  49  =

^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  50  	=
for (blk =3D 0; ; blk++, put_dev_sector(sect)) {
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  51  	=
	if (blk =3D=3D RDB_ALLOCATION_LIMIT)
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  52  	=
		goto rdb_done;
1493bf217f7f59 fs/partitions/amiga.c    Tejun Heo         2010-05-15  53  	=
	data =3D read_part_sector(state, blk, &sect);
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  54  	=
	if (!data) {
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  55  	=
		pr_err("Dev %s: unable to read RDB block %llu\n",
a08aa9bccdc282 block/partitions/amiga.c Christoph Hellwig 2021-08-10  56  	=
		       state->disk->disk_name, blk);
57881dd9df40b7 fs/partitions/amiga.c    Suzuki K P        2006-12-06  57  	=
		res =3D -1;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  58  	=
		goto rdb_done;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  59  	=
	}
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  60  	=
	if (*(__be32 *)data !=3D cpu_to_be32(IDNAME_RIGIDDISK))
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  61  	=
		continue;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  62  =

^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  63  	=
	rdb =3D (struct RigidDiskBlock *)data;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  64  	=
	if (checksum_block((__be32 *)data, be32_to_cpu(rdb->rdb_SummedLongs) & 0x7=
F) =3D=3D 0)
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  65  	=
		break;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  66  	=
	/* Try again with 0xdc..0xdf zeroed, Windows might have
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  67  	=
	 * trashed it.
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  68  	=
	 */
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  69  	=
	*(__be32 *)(data+0xdc) =3D 0;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  70  	=
	if (checksum_block((__be32 *)data,
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  71  	=
			be32_to_cpu(rdb->rdb_SummedLongs) & 0x7F)=3D=3D0) {
6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  72  	=
		pr_err("Trashed word at 0xd0 in block %llu ignored in checksum calculatio=
n\n",
600ffc5ead7fd0 block/partitions/amiga.c Fabian Frederick  2014-06-12  73  	=
		       blk);
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  74  	=
		break;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  75  	=
	}
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  76  =

6b86551e8891f0 block/partitions/amiga.c Michael Schmitz   2022-08-23  77  	=
	pr_err("Dev %s: RDB in block %llu has bad checksum\n",
a08aa9bccdc282 block/partitions/amiga.c Christoph Hellwig 2021-08-10  78  	=
	       state->disk->disk_name, blk);
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  79  	}
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  80  =

^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  81  	=
/* blksize is blocks per 512 byte standard block */
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  82  	=
blksize =3D be32_to_cpu( rdb->rdb_BlockBytes ) / 512;
^1da177e4c3f41 fs/partitions/amiga.c    Linus Torvalds    2005-04-16  83  =

9c867fbe06458a fs/partitions/amiga.c    Alexey Dobriyan   2010-08-10  84  	{
9c867fbe06458a fs/partitions/amiga.c    Alexey Dobriyan   2010-08-10  85  	=
	char tmp[7 + 10 + 1 + 1];
9c867fbe06458a fs/partitions/amiga.c    Alexey Dobriyan   2010-08-10  86  =

9c867fbe06458a fs/partitions/amiga.c    Alexey Dobriyan   2010-08-10  87  	=
	/* Be more informative */
9c867fbe06458a fs/partitions/amiga.c    Alexey Dobriyan   2010-08-10 @88  	=
	snprintf(tmp, sizeof(tmp), " RDSK (%d)", blksize * 512);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3546467497555344943==--

