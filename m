Content-Type: multipart/mixed; boundary="===============2307123434364090661=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:drm-misc-next 7/11] drivers/gpu/drm/selftests/test-drm_buddy.c:184:20-25: ERROR: invalid reference to the index variable of the iterator on line 139
Date: Sat, 26 Feb 2022 02:34:18 +0800
Message-ID: <202202260241.6kk29PxS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2307123434364090661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   f915686bd97a9c234602426e6d132b74a112a8d6
commit: 92937f170d3f49f41d7acb86243ee691a98eb2be [7/11] drm/selftests: add =
drm buddy alloc range testcase
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
226/202202260241.6kk29PxS-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/selftests/test-drm_buddy.c:184:20-25: ERROR: invalid ref=
erence to the index variable of the iterator on line 139

vim +184 drivers/gpu/drm/selftests/test-drm_buddy.c

92937f170d3f49 Arunpravin 2022-02-22  124  =

92937f170d3f49 Arunpravin 2022-02-22  125  static int igt_check_blocks(stru=
ct drm_buddy *mm,
92937f170d3f49 Arunpravin 2022-02-22  126  			    struct list_head *blocks,
92937f170d3f49 Arunpravin 2022-02-22  127  			    u64 expected_size,
92937f170d3f49 Arunpravin 2022-02-22  128  			    bool is_contiguous)
92937f170d3f49 Arunpravin 2022-02-22  129  {
92937f170d3f49 Arunpravin 2022-02-22  130  	struct drm_buddy_block *block;
92937f170d3f49 Arunpravin 2022-02-22  131  	struct drm_buddy_block *prev;
92937f170d3f49 Arunpravin 2022-02-22  132  	u64 total;
92937f170d3f49 Arunpravin 2022-02-22  133  	int err =3D 0;
92937f170d3f49 Arunpravin 2022-02-22  134  =

92937f170d3f49 Arunpravin 2022-02-22  135  	block =3D NULL;
92937f170d3f49 Arunpravin 2022-02-22  136  	prev =3D NULL;
92937f170d3f49 Arunpravin 2022-02-22  137  	total =3D 0;
92937f170d3f49 Arunpravin 2022-02-22  138  =

92937f170d3f49 Arunpravin 2022-02-22 @139  	list_for_each_entry(block, bloc=
ks, link) {
92937f170d3f49 Arunpravin 2022-02-22  140  		err =3D igt_check_block(mm, bl=
ock);
92937f170d3f49 Arunpravin 2022-02-22  141  =

92937f170d3f49 Arunpravin 2022-02-22  142  		if (!drm_buddy_block_is_alloca=
ted(block)) {
92937f170d3f49 Arunpravin 2022-02-22  143  			pr_err("block not allocated\n=
"),
92937f170d3f49 Arunpravin 2022-02-22  144  			       err =3D -EINVAL;
92937f170d3f49 Arunpravin 2022-02-22  145  		}
92937f170d3f49 Arunpravin 2022-02-22  146  =

92937f170d3f49 Arunpravin 2022-02-22  147  		if (is_contiguous && prev) {
92937f170d3f49 Arunpravin 2022-02-22  148  			u64 prev_block_size;
92937f170d3f49 Arunpravin 2022-02-22  149  			u64 prev_offset;
92937f170d3f49 Arunpravin 2022-02-22  150  			u64 offset;
92937f170d3f49 Arunpravin 2022-02-22  151  =

92937f170d3f49 Arunpravin 2022-02-22  152  			prev_offset =3D drm_buddy_blo=
ck_offset(prev);
92937f170d3f49 Arunpravin 2022-02-22  153  			prev_block_size =3D drm_buddy=
_block_size(mm, prev);
92937f170d3f49 Arunpravin 2022-02-22  154  			offset =3D drm_buddy_block_of=
fset(block);
92937f170d3f49 Arunpravin 2022-02-22  155  =

92937f170d3f49 Arunpravin 2022-02-22  156  			if (offset !=3D (prev_offset =
+ prev_block_size)) {
92937f170d3f49 Arunpravin 2022-02-22  157  				pr_err("block offset mismatc=
h\n");
92937f170d3f49 Arunpravin 2022-02-22  158  				err =3D -EINVAL;
92937f170d3f49 Arunpravin 2022-02-22  159  			}
92937f170d3f49 Arunpravin 2022-02-22  160  		}
92937f170d3f49 Arunpravin 2022-02-22  161  =

92937f170d3f49 Arunpravin 2022-02-22  162  		if (err)
92937f170d3f49 Arunpravin 2022-02-22  163  			break;
92937f170d3f49 Arunpravin 2022-02-22  164  =

92937f170d3f49 Arunpravin 2022-02-22  165  		total +=3D drm_buddy_block_siz=
e(mm, block);
92937f170d3f49 Arunpravin 2022-02-22  166  		prev =3D block;
92937f170d3f49 Arunpravin 2022-02-22  167  	}
92937f170d3f49 Arunpravin 2022-02-22  168  =

92937f170d3f49 Arunpravin 2022-02-22  169  	if (!err) {
92937f170d3f49 Arunpravin 2022-02-22  170  		if (total !=3D expected_size) {
92937f170d3f49 Arunpravin 2022-02-22  171  			pr_err("size mismatch, expect=
ed=3D%llx, found=3D%llx\n",
92937f170d3f49 Arunpravin 2022-02-22  172  			       expected_size, total);
92937f170d3f49 Arunpravin 2022-02-22  173  			err =3D -EINVAL;
92937f170d3f49 Arunpravin 2022-02-22  174  		}
92937f170d3f49 Arunpravin 2022-02-22  175  		return err;
92937f170d3f49 Arunpravin 2022-02-22  176  	}
92937f170d3f49 Arunpravin 2022-02-22  177  =

92937f170d3f49 Arunpravin 2022-02-22  178  	if (prev) {
92937f170d3f49 Arunpravin 2022-02-22  179  		pr_err("prev block, dump:\n");
92937f170d3f49 Arunpravin 2022-02-22  180  		igt_dump_block(mm, prev);
92937f170d3f49 Arunpravin 2022-02-22  181  	}
92937f170d3f49 Arunpravin 2022-02-22  182  =

92937f170d3f49 Arunpravin 2022-02-22  183  	pr_err("bad block, dump:\n");
92937f170d3f49 Arunpravin 2022-02-22 @184  	igt_dump_block(mm, block);
92937f170d3f49 Arunpravin 2022-02-22  185  =

92937f170d3f49 Arunpravin 2022-02-22  186  	return err;
92937f170d3f49 Arunpravin 2022-02-22  187  }
92937f170d3f49 Arunpravin 2022-02-22  188  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2307123434364090661==--

