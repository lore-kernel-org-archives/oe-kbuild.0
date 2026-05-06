Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B63ECBFC
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060685; cv=none; b=SWfm0BJeWAa88FLtlKkd5gyDkFmPIVG6Od5u2iH/4X8pJjI+4CFH/5L0eQ+wbtzqlsSsuWhGv/5SH0vln2y+DiiLO/VGXU3sDEHbMpIlRHBS3ArF7ge51xh8m9w3q2DRYraHRGWHj1gp8Q1F1sk1nswbq+PzhSXtKFz4PkmLrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060685; c=relaxed/simple;
	bh=Ld+PmTL7b2a4aU/YkYT5tg6q2iiscfNFxbTj3s1HBws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i9jVcDEZ8SP+BDbuRRwqjyIMkJagFwtl/yMH8CDO3u61XyusSdrHhs9ejTs/PaHtEw1Twsfmi2e8jJetXKog2KWfJ+UlByT5/Ac2WBL0AbHBt9YppixFDS2LVDx5kk6Dx6QI9fm8VVwdzPqZn/IYkKoXAQrHy4dy38l/EQfDTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAIM69Ml; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAIM69Ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778060679; x=1809596679;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ld+PmTL7b2a4aU/YkYT5tg6q2iiscfNFxbTj3s1HBws=;
  b=dAIM69Mlg0Ecxwh5VaTovN2tVV8Blrb1Lw25zPzCrnSHu5kQ/KxN7uX5
   1fymD+egvO3tJ/9OIDl93X7C4JMwq1cqyadr/zR5n48ijAhWafGnpebMy
   6MoZJti8+CMAEx7uQzj1olB4tilfy3GDqB/D9xrGJzHfhTsUNjDvNRRV7
   kvPsjxiE4UAdh0BEaZz3Cd/OoBh6dK5N6ngliT7Y1pkVXRuoXkbgQT0ew
   jRWLgISmi5hqa8fs3TXBb15gQQAM/tqwKMf7/vLAoZTqj+h2ViMijRjZ0
   wdCmMHg63kO1WvMGz/R6TIfTFtz7zQ5GFcPIIs0+prDhhZ2R+il3AMXwO
   g==;
X-CSE-ConnectionGUID: rFcEuyjzS3yvwn8XvrV2FA==
X-CSE-MsgGUID: FNyrPyr8TDG8bY4qYwCpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90365001"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90365001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:44:33 -0700
X-CSE-ConnectionGUID: C0pdzcuGRJqHBIx8GZfNWA==
X-CSE-MsgGUID: CcpdOWRAShmWA1Xdv3eCkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236337092"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2026 02:44:31 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKYns-000000000rB-3R67;
	Wed, 06 May 2026 09:44:28 +0000
Date: Wed, 06 May 2026 17:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1473/2999]
 drivers/iio/industrialio-buffer.c:1919 iio_buffer_enqueue_dmabuf() warn:
 passing freed memory '&fence->base' (line 1912)
Message-ID: <202605061755.fd9wYMRa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Beno=C3=AEt Monin" <benoit.monin@bootlin.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Paul Cercueil <paul@crapouillou.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
commit: 1eb4da93bfac9e86b2be92d445034c112bf382f0 [1473/2999] iio: buffer: F=
ix DMA fence leak in iio_buffer_enqueue_dmabuf()
:::::: branch date: 21 hours ago
:::::: commit date: 8 days ago
config: xtensa-randconfig-r073-20260505 (https://download.01.org/0day-ci/ar=
chive/20260506/202605061755.fd9wYMRa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605061755.fd9wYMRa-lkp@intel.com/

New smatch warnings:
drivers/iio/industrialio-buffer.c:1919 iio_buffer_enqueue_dmabuf() warn: pa=
ssing freed memory '&fence->base' (line 1912)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: incons=
istent indenting
drivers/iio/industrialio-buffer.c:2034 iio_device_buffer_getfd() warn: pote=
ntial spectre issue 'iio_dev_opaque->attached_buffers' [r] (local cap)
drivers/iio/industrialio-buffer.c:2036 iio_device_buffer_getfd() warn: poss=
ible spectre second half.  'buffer'

vim +1919 drivers/iio/industrialio-buffer.c

3e26d9f08fbe0b Paul Cercueil  2024-06-20  1821 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1822  static int iio_buffer_enque=
ue_dmabuf(struct iio_dev_buffer_pair *ib,
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1823  				     struct iio_dmabuf =
__user *iio_dmabuf_req,
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1824  				     bool nonblock)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1825  {
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1826  	struct iio_buffer *buffer =
=3D ib->buffer;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1827  	struct iio_dmabuf iio_dmab=
uf;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1828  	struct dma_buf_attachment =
*attach;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1829  	struct iio_dmabuf_priv *pr=
iv;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1830  	struct iio_dma_fence *fenc=
e;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1831  	struct dma_buf *dmabuf;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1832  	unsigned long timeout;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1833  	bool cookie, cyclic, dma_t=
o_ram;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1834  	long retl;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1835  	u32 seqno;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1836  	int ret;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1837 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1838  	if (copy_from_user(&iio_dm=
abuf, iio_dmabuf_req, sizeof(iio_dmabuf)))
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1839  		return -EFAULT;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1840 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1841  	if (iio_dmabuf.flags & ~II=
O_BUFFER_DMABUF_SUPPORTED_FLAGS)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1842  		return -EINVAL;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1843 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1844  	cyclic =3D iio_dmabuf.flag=
s & IIO_BUFFER_DMABUF_CYCLIC;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1845 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1846  	/* Cyclic flag is only sup=
ported on output buffers */
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1847  	if (cyclic && buffer->dire=
ction !=3D IIO_BUFFER_DIRECTION_OUT)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1848  		return -EINVAL;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1849 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1850  	dmabuf =3D dma_buf_get(iio=
_dmabuf.fd);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1851  	if (IS_ERR(dmabuf))
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1852  		return PTR_ERR(dmabuf);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1853 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1854  	if (!iio_dmabuf.bytes_used=
 || iio_dmabuf.bytes_used > dmabuf->size) {
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1855  		ret =3D -EINVAL;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1856  		goto err_dmabuf_put;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1857  	}
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1858 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1859  	attach =3D iio_buffer_find=
_attachment(ib, dmabuf, nonblock);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1860  	if (IS_ERR(attach)) {
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1861  		ret =3D PTR_ERR(attach);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1862  		goto err_dmabuf_put;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1863  	}
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1864 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1865  	priv =3D attach->importer_=
priv;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1866 =20
bf4afc53b77aea Linus Torvalds 2026-02-21  1867  	fence =3D kmalloc_obj(*fen=
ce);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1868  	if (!fence) {
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1869  		ret =3D -ENOMEM;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1870  		goto err_attachment_put;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1871  	}
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1872 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1873  	fence->priv =3D priv;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1874 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1875  	seqno =3D atomic_add_retur=
n(1, &priv->seqno);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1876 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1877  	/*
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1878  	 * The transfers are guara=
nteed to be processed in the order they are
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1879  	 * enqueued, so we can use=
 a simple incrementing sequence number for
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1880  	 * the dma_fence.
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1881  	 */
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1882  	dma_fence_init(&fence->bas=
e, &iio_buffer_dma_fence_ops,
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1883  		       &priv->lock, priv-=
>context, seqno);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1884 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1885  	ret =3D iio_dma_resv_lock(=
dmabuf, nonblock);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1886  	if (ret)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1887  		goto err_fence_put;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1888 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1889  	timeout =3D nonblock ? 0 :=
 msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1890  	dma_to_ram =3D buffer->dir=
ection =3D=3D IIO_BUFFER_DIRECTION_IN;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1891 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1892  	/* Make sure we don't have=
 writers */
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1893  	retl =3D dma_resv_wait_tim=
eout(dmabuf->resv,
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1894  				     dma_resv_usage_rw(=
dma_to_ram),
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1895  				     true, timeout);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1896  	if (retl =3D=3D 0)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1897  		retl =3D -EBUSY;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1898  	if (retl < 0) {
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1899  		ret =3D (int)retl;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1900  		goto err_resv_unlock;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1901  	}
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1902 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1903  	if (buffer->access->lock_q=
ueue)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1904  		buffer->access->lock_queu=
e(buffer);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1905 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1906  	ret =3D dma_resv_reserve_f=
ences(dmabuf->resv, 1);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1907  	if (ret)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1908  		goto err_queue_unlock;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1909 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1910  	dma_resv_add_fence(dmabuf-=
>resv, &fence->base,
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1911  			   dma_to_ram ? DMA_RESV=
_USAGE_WRITE : DMA_RESV_USAGE_READ);
1eb4da93bfac9e Beno=C3=AEt Monin   2026-04-01 @1912  	dma_fence_put(&fence-=
>base);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1913  	dma_resv_unlock(dmabuf->re=
sv);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1914 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1915  	cookie =3D dma_fence_begin=
_signalling();
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1916 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1917  	ret =3D buffer->access->en=
queue_dmabuf(buffer, priv->block, &fence->base,
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1918  					     priv->sgt, iio_dm=
abuf.bytes_used,
3e26d9f08fbe0b Paul Cercueil  2024-06-20 @1919  					     cyclic);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1920  	if (ret) {
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1921  		/*
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1922  		 * DMABUF enqueue failed,=
 but we already added the fence.
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1923  		 * Signal the error throu=
gh the fence completion mechanism.
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1924  		 */
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1925  		iio_buffer_signal_dmabuf_=
done(&fence->base, ret);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1926  	}
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1927 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1928  	if (buffer->access->unlock=
_queue)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1929  		buffer->access->unlock_qu=
eue(buffer);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1930 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1931  	dma_fence_end_signalling(c=
ookie);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1932  	dma_buf_put(dmabuf);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1933 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1934  	return ret;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1935 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1936  err_queue_unlock:
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1937  	if (buffer->access->unlock=
_queue)
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1938  		buffer->access->unlock_qu=
eue(buffer);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1939  err_resv_unlock:
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1940  	dma_resv_unlock(dmabuf->re=
sv);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1941  err_fence_put:
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1942  	dma_fence_put(&fence->base=
);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1943  err_attachment_put:
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1944  	iio_buffer_dmabuf_put(atta=
ch);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1945  err_dmabuf_put:
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1946  	dma_buf_put(dmabuf);
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1947 =20
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1948  	return ret;
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1949  }
3e26d9f08fbe0b Paul Cercueil  2024-06-20  1950 =20

:::::: The code at line 1919 was first introduced by commit
:::::: 3e26d9f08fbe0b73e951a5e810fdb7a332b7e37f iio: core: Add new DMABUF i=
nterface infrastructure

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
