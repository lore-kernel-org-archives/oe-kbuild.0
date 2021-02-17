Content-Type: multipart/mixed; boundary="===============5665013973321078149=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [iio:testing 47/53] drivers/iio/buffer/industrialio-buffer-dma.c:669:11: warning: Unsigned variable 'i' can't be negative so it is unnecessary to test it.
Date: Thu, 18 Feb 2021 01:44:37 +0800
Message-ID: <202102180129.lcamhIzL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5665013973321078149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Ardelean <alexandru.ardelean@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   0fd146b288591a8139220fec417dfc5652820480
commit: b9ad66ba4db6f349aa795ed59c3e42d4208844fa [47/53] iio: buffer-dma: A=
dd mmap support
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/buffer/industrialio-buffer-dma.c:669:11: warning: Unsigned v=
ariable 'i' can't be negative so it is unnecessary to test it. [unsignedPos=
itive]
    for (; i >=3D 0; i--)
             ^

vim +669 drivers/iio/buffer/industrialio-buffer-dma.c

670b19ae9bfdbc Lars-Peter Clausen 2015-10-13  603  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  604  int iio_dma_buffer_alloc=
_blocks(struct iio_buffer *buffer,
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  605  				struct iio_buffer_bl=
ock_alloc_req *req)
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  606  {
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  607  	struct iio_dma_buffer_q=
ueue *queue =3D iio_buffer_to_queue(buffer);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  608  	struct iio_dma_buffer_b=
lock **blocks;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  609  	unsigned int num_blocks;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  610  	unsigned int i;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  611  	int ret =3D 0;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  612  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  613  	mutex_lock(&queue->lock=
);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  614  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  615  	/*
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  616  	 * If the buffer is ena=
bled and in fileio mode new blocks can't be
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  617  	 * allocated.
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  618  	 */
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  619  	if (queue->fileio.enabl=
ed) {
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  620  		ret =3D -EBUSY;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  621  		goto err_unlock;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  622  	}
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  623  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  624  	/* Free memory that mig=
ht be in use for fileio mode */
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  625  	iio_dma_buffer_fileio_f=
ree(queue);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  626  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  627  	/* 64 blocks ought to b=
e enough for anybody ;) */
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  628  	if (req->count > 64 - q=
ueue->num_blocks)
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  629  		req->count =3D 64 - qu=
eue->num_blocks;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  630  	if (req->size > iio_dma=
_buffer_max_block_size)
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  631  		req->size =3D iio_dma_=
buffer_max_block_size;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  632  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  633  	req->id =3D queue->num_=
blocks;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  634  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  635  	if (req->count =3D=3D 0=
 || req->size =3D=3D 0) {
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  636  		ret =3D 0;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  637  		goto err_unlock;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  638  	}
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  639  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  640  	num_blocks =3D req->cou=
nt + queue->num_blocks;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  641  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  642  	blocks =3D krealloc(que=
ue->blocks, sizeof(*blocks) * num_blocks,
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  643  			  GFP_KERNEL);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  644  	if (!blocks) {
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  645  		ret =3D -ENOMEM;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  646  		goto err_unlock;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  647  	}
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  648  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  649  	for (i =3D queue->num_b=
locks; i < num_blocks; i++) {
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  650  		blocks[i] =3D iio_dma_=
buffer_alloc_block(queue, req->size);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  651  		if (!blocks[i]) {
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  652  			ret =3D -ENOMEM;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  653  			goto err_unwind;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  654  		}
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  655  		blocks[i]->block.id =
=3D i;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  656  		blocks[i]->block.data.=
offset =3D queue->max_offset;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  657  		queue->max_offset +=3D=
 PAGE_ALIGN(req->size);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  658  	}
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  659  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  660  	req->count =3D i - queu=
e->num_blocks;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  661  	queue->num_blocks =3D i;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  662  	queue->blocks =3D block=
s;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  663  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  664  	mutex_unlock(&queue->lo=
ck);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  665  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  666  	return 0;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  667  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  668  err_unwind:
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15 @669  	for (; i >=3D 0; i--)
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  670  		iio_buffer_block_put(b=
locks[i]);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  671  	kfree(blocks);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  672  err_unlock:
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  673  	mutex_unlock(&queue->lo=
ck);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  674  =

b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  675  	return ret;
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  676  }
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  677  EXPORT_SYMBOL_GPL(iio_dm=
a_buffer_alloc_blocks);
b9ad66ba4db6f3 Lars-Peter Clausen 2021-02-15  678  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5665013973321078149==--

