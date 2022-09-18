Content-Type: multipart/mixed; boundary="===============0168427822724580088=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 194/7639] drivers/gpu/drm/tests/drm_buddy_test.c:197:26-31: ERROR: invalid reference to the index variable of the iterator on line 152
Date: Mon, 19 Sep 2022 05:16:28 +0800
Message-ID: <202209190520.eHVvA86s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0168427822724580088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ma=C3=ADra Canal" <maira.canal@usp.br>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: 932da861956ac425ba4e65f7696458f96d833883 [194/7639] drm: selftest: =
convert drm_buddy selftest to KUnit
:::::: branch date: 3 days ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-c041-20220918 (https://download.01.org/0day-ci/archi=
ve/20220919/202209190520.eHVvA86s-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tests/drm_buddy_test.c:197:26-31: ERROR: invalid referen=
ce to the index variable of the iterator on line 152

vim +197 drivers/gpu/drm/tests/drm_buddy_test.c

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  139  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  140  static int igt_check_block=
s(struct kunit *test, struct drm_buddy *mm,
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  141  			    struct list_head *b=
locks, u64 expected_size, bool is_contiguous)
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  142  {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  143  	struct drm_buddy_block *b=
lock;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  144  	struct drm_buddy_block *p=
rev;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  145  	u64 total;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  146  	int err =3D 0;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  147  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  148  	block =3D NULL;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  149  	prev =3D NULL;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  150  	total =3D 0;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  151  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08 @152  	list_for_each_entry(block=
, blocks, link) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  153  		err =3D igt_check_block(=
test, mm, block);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  154  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  155  		if (!drm_buddy_block_is_=
allocated(block)) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  156  			kunit_err(test, "block =
not allocated\n");
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  157  			err =3D -EINVAL;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  158  		}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  159  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  160  		if (is_contiguous && pre=
v) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  161  			u64 prev_block_size;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  162  			u64 prev_offset;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  163  			u64 offset;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  164  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  165  			prev_offset =3D drm_bud=
dy_block_offset(prev);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  166  			prev_block_size =3D drm=
_buddy_block_size(mm, prev);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  167  			offset =3D drm_buddy_bl=
ock_offset(block);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  168  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  169  			if (offset !=3D (prev_o=
ffset + prev_block_size)) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  170  				kunit_err(test, "block=
 offset mismatch\n");
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  171  				err =3D -EINVAL;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  172  			}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  173  		}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  174  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  175  		if (err)
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  176  			break;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  177  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  178  		total +=3D drm_buddy_blo=
ck_size(mm, block);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  179  		prev =3D block;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  180  	}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  181  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  182  	if (!err) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  183  		if (total !=3D expected_=
size) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  184  			kunit_err(test, "size m=
ismatch, expected=3D%llx, found=3D%llx\n",
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  185  				  expected_size, total=
);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  186  			err =3D -EINVAL;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  187  		}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  188  		return err;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  189  	}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  190  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  191  	if (prev) {
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  192  		kunit_err(test, "prev bl=
ock, dump:\n");
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  193  		igt_dump_block(test, mm,=
 prev);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  194  	}
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  195  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  196  	kunit_err(test, "bad bloc=
k, dump:\n");
932da861956ac4 Ma=C3=ADra Canal 2022-07-08 @197  	igt_dump_block(test, mm, =
block);
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  198  =

932da861956ac4 Ma=C3=ADra Canal 2022-07-08  199  	return err;
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  200  }
932da861956ac4 Ma=C3=ADra Canal 2022-07-08  201  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0168427822724580088==--

