Content-Type: multipart/mixed; boundary="===============6847252225317595857=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 39/44] drivers/misc/habanalabs/common/memory_mgr.c:177 hl_mem_mgr_mmap() warn: should 'vma->vm_pgoff << 12' be a 64 bit type?
Date: Tue, 03 May 2022 00:31:48 +0800
Message-ID: <202205030041.4ZAjsOHz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6847252225317595857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yuri Nudelman <ynudelman@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   31b4e207e4199cd59aac5e6f4f546bcc8410558b
commit: 7b93ce064842618e135c1eb98d62144a7b42c7f4 [39/44] habanalabs: hide m=
emory manager page shift
:::::: branch date: 4 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
503/202205030041.4ZAjsOHz-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/memory_mgr.c:177 hl_mem_mgr_mmap() warn: sho=
uld 'vma->vm_pgoff << 12' be a 64 bit type?

vim +177 drivers/misc/habanalabs/common/memory_mgr.c

dbb42df4b94ab9 Yuri Nudelman          2022-03-20  156  =

dbb42df4b94ab9 Yuri Nudelman          2022-03-20  157  /**
a2cd87c2d89789 Rajaravi Krishna Katta 2022-04-01  158   * hl_mem_mgr_mmap -=
 map the given buffer to the user
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  159   *
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  160   * @mmg: unifed memo=
ry manager
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  161   * @vma: the vma obj=
ect for which mmap was closed.
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  162   * @args: additional=
 args passed to behavior->mmap
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  163   *
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  164   * Map the buffer sp=
ecified by the vma->vm_pgoff to the given vma.
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  165   */
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  166  int hl_mem_mgr_mmap(=
struct hl_mem_mgr *mmg, struct vm_area_struct *vma,
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  167  		    void *args)
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  168  {
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  169  	struct hl_mmap_mem_=
buf *buf;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  170  	u64 user_mem_size;
7b93ce06484261 Yuri Nudelman          2022-03-23  171  	u64 handle;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  172  	int rc;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  173  =

dbb42df4b94ab9 Yuri Nudelman          2022-03-20  174  	/* We use the page =
offset to hold the idr and thus we need to clear
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  175  	 * it before doing =
the mmap itself
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  176  	 */
7b93ce06484261 Yuri Nudelman          2022-03-23 @177  	handle =3D vma->vm_=
pgoff << PAGE_SHIFT;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  178  	vma->vm_pgoff =3D 0;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  179  =

dbb42df4b94ab9 Yuri Nudelman          2022-03-20  180  	/* Reference was ta=
ken here */
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  181  	buf =3D hl_mmap_mem=
_buf_get(mmg, handle);
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  182  	if (!buf) {
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  183  		dev_err(mmg->dev,
7b93ce06484261 Yuri Nudelman          2022-03-23  184  			"Memory mmap fail=
ed, no match to handle %llu\n", handle);
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  185  		return -EINVAL;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  186  	}
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  187  =

dbb42df4b94ab9 Yuri Nudelman          2022-03-20  188  	/* Validation check=
 */
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  189  	user_mem_size =3D v=
ma->vm_end - vma->vm_start;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  190  	if (user_mem_size !=
=3D ALIGN(buf->mappable_size, PAGE_SIZE)) {
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  191  		dev_err(mmg->dev,
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  192  			"Memory mmap fail=
ed, mmap VM size 0x%llx !=3D 0x%llx allocated physical mem size\n",
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  193  			user_mem_size, bu=
f->mappable_size);
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  194  		rc =3D -EINVAL;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  195  		goto put_mem;
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  196  	}
dbb42df4b94ab9 Yuri Nudelman          2022-03-20  197  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6847252225317595857==--

