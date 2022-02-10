Content-Type: multipart/mixed; boundary="===============0621131619253668641=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 07/10] nvmet: add copy command support for bdev and file ns
Date: Fri, 11 Feb 2022 06:49:55 +0800
Message-ID: <202202110625.4yHrKaUn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0621131619253668641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207141348.4235-8-nj.shetty@samsung.com>
References: <20220207141348.4235-8-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
TO: mpatocka(a)redhat.com
CC: javier(a)javigon.com
CC: chaitanyak(a)nvidia.com
CC: linux-block(a)vger.kernel.org
CC: linux-scsi(a)vger.kernel.org
CC: dm-devel(a)redhat.com
CC: linux-nvme(a)lists.infradead.org
CC: linux-fsdevel(a)vger.kernel.org
CC: axboe(a)kernel.dk
CC: msnitzer(a)redhat.com
CC: bvanassche(a)acm.org
CC: martin.petersen(a)oracle.com
CC: roland(a)purestorage.com
CC: hare(a)suse.de
CC: kbusch(a)kernel.org
CC: hch(a)lst.de
CC: Frederick.Knight(a)netapp.com
CC: zach.brown(a)ni.com
CC: osandov(a)fb.com
CC: lsf-pc(a)lists.linux-foundation.org
CC: djwong(a)kernel.org
CC: josef(a)toxicpanda.com
CC: clm(a)fb.com
CC: dsterba(a)suse.com
CC: tytso(a)mit.edu
CC: jack(a)suse.com
CC: joshi.k(a)samsung.com
CC: arnav.dawn(a)samsung.com
CC: nj.shetty(a)samsung.com

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v5.17-rc3 next-20220210]
[cannot apply to device-mapper-dm/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nitesh-Shetty/block-make-b=
io_map_kern-non-static/20220207-231407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220207 (https://download.01.org/0day-ci/arch=
ive/20220211/202202110625.4yHrKaUn-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/nvme/target/io-cmd-file.c:377 nvmet_file_copy_work() error: uniniti=
alized symbol 'len'.
drivers/nvme/target/io-cmd-bdev.c:479 nvmet_bdev_execute_copy() warn: shoul=
d '(((range.nlb)) + 1) << req->ns->blksize_shift' be a 64 bit type?

Old smatch warnings:
drivers/nvme/target/io-cmd-bdev.c:377 nvmet_bdev_discard_range() warn: shou=
ld '((range->nlb)) << (ns->blksize_shift - 9)' be a 64 bit type?

vim +/len +377 drivers/nvme/target/io-cmd-file.c

d5eff33ee6f8086 Chaitanya Kulkarni 2018-05-23  349  =

6bb6ea64499e1ac Arnav Dawn         2022-02-07  350  static void nvmet_file_=
copy_work(struct work_struct *w)
6bb6ea64499e1ac Arnav Dawn         2022-02-07  351  {
6bb6ea64499e1ac Arnav Dawn         2022-02-07  352  	struct nvmet_req *req =
=3D container_of(w, struct nvmet_req, f.work);
6bb6ea64499e1ac Arnav Dawn         2022-02-07  353  	int nr_range;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  354  	loff_t pos;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  355  	struct nvme_command *c=
mnd =3D req->cmd;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  356  	int ret =3D 0, len, sr=
c, id;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  357  =

6bb6ea64499e1ac Arnav Dawn         2022-02-07  358  	nr_range =3D cmnd->cop=
y.nr_range + 1;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  359  	pos =3D le64_to_cpu(re=
q->cmd->copy.sdlba) << req->ns->blksize_shift;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  360  	if (unlikely(pos + req=
->transfer_len > req->ns->size)) {
6bb6ea64499e1ac Arnav Dawn         2022-02-07  361  		nvmet_req_complete(re=
q, errno_to_nvme_status(req, -ENOSPC));
6bb6ea64499e1ac Arnav Dawn         2022-02-07  362  		return;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  363  	}
6bb6ea64499e1ac Arnav Dawn         2022-02-07  364  =

6bb6ea64499e1ac Arnav Dawn         2022-02-07  365  	for (id =3D 0 ; id < n=
r_range; id++) {
6bb6ea64499e1ac Arnav Dawn         2022-02-07  366  		struct nvme_copy_rang=
e range;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  367  =

6bb6ea64499e1ac Arnav Dawn         2022-02-07  368  		ret =3D nvmet_copy_fr=
om_sgl(req, id * sizeof(range), &range,
6bb6ea64499e1ac Arnav Dawn         2022-02-07  369  					sizeof(range));
6bb6ea64499e1ac Arnav Dawn         2022-02-07  370  		if (ret)
6bb6ea64499e1ac Arnav Dawn         2022-02-07  371  			goto out;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  372  =

6bb6ea64499e1ac Arnav Dawn         2022-02-07  373  		len =3D (le16_to_cpu(=
range.nlb) + 1) << (req->ns->blksize_shift);
6bb6ea64499e1ac Arnav Dawn         2022-02-07  374  		src =3D (le64_to_cpu(=
range.slba) << (req->ns->blksize_shift));
6bb6ea64499e1ac Arnav Dawn         2022-02-07  375  		ret =3D vfs_copy_file=
_range(req->ns->file, src, req->ns->file, pos, len, 0);
6bb6ea64499e1ac Arnav Dawn         2022-02-07  376  out:
6bb6ea64499e1ac Arnav Dawn         2022-02-07 @377  		if (ret !=3D len) {
6bb6ea64499e1ac Arnav Dawn         2022-02-07  378  			pos +=3D ret;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  379  			req->cqe->result.u32=
 =3D cpu_to_le32(id);
6bb6ea64499e1ac Arnav Dawn         2022-02-07  380  			nvmet_req_complete(r=
eq, ret < 0 ? errno_to_nvme_status(req, ret) :
6bb6ea64499e1ac Arnav Dawn         2022-02-07  381  					errno_to_nvme_stat=
us(req, -EIO));
6bb6ea64499e1ac Arnav Dawn         2022-02-07  382  			return;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  383  =

6bb6ea64499e1ac Arnav Dawn         2022-02-07  384  		} else
6bb6ea64499e1ac Arnav Dawn         2022-02-07  385  			pos +=3D len;
6bb6ea64499e1ac Arnav Dawn         2022-02-07  386  }
6bb6ea64499e1ac Arnav Dawn         2022-02-07  387  	nvmet_req_complete(req=
, ret);
6bb6ea64499e1ac Arnav Dawn         2022-02-07  388  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0621131619253668641==--

