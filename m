Content-Type: multipart/mixed; boundary="===============0194520204106948781=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 2697/3843] drivers/mtd/nand/raw/cadence-nand-controller.c:1903 cadence_nand_read_buf() error: we previously assumed 'cdns_ctrl->dmac' could be null (see line 1889)
Date: Thu, 10 Oct 2019 11:39:26 +0300
Message-ID: <20191010083926.GJ13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0194520204106948781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   1ba4389f4572d716d73f8bacab4e181d82504780
commit: ec4ba01e894d3165e4d1ccbef782ef5593b708b4 [2697/3843] mtd: rawnand: =
Add new Cadence NAND driver to MTD subsystem

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/nand/raw/cadence-nand-controller.c:1903 cadence_nand_read_buf()=
 error: we previously assumed 'cdns_ctrl->dmac' could be null (see line 188=
9)
drivers/mtd/nand/raw/cadence-nand-controller.c:1959 cadence_nand_write_buf(=
) error: we previously assumed 'cdns_ctrl->dmac' could be null (see line 19=
43)

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dec4ba01e894d3165e4d1ccbef782ef5593b708b4
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout ec4ba01e894d3165e4d1ccbef782ef5593b708b4
vim +1903 drivers/mtd/nand/raw/cadence-nand-controller.c

ec4ba01e894d31 Piotr Sroka 2019-09-26  1861  static int cadence_nand_read_b=
uf(struct cdns_nand_ctrl *cdns_ctrl,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1862  				 u8 *buf, int len)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1863  {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1864  	u8 thread_nr =3D 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1865  	u32 sdma_size;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1866  	int status;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1867  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1868  	/* Wait until slave DMA inter=
face is ready to data transfer. */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1869  	status =3D cadence_nand_wait_=
on_sdma(cdns_ctrl, &thread_nr, &sdma_size);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1870  	if (status)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1871  		return status;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1872  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1873  	if (!cdns_ctrl->caps1->has_dm=
a) {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1874  		int len_in_words =3D len >> =
2;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1875  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1876  		/* read alingment data */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1877  		ioread32_rep(cdns_ctrl->io.v=
irt, buf, len_in_words);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1878  		if (sdma_size > len) {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1879  			/* read rest data from slav=
e DMA interface if any */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1880  			ioread32_rep(cdns_ctrl->io.=
virt, cdns_ctrl->buf,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1881  				     sdma_size / 4 - len_i=
n_words);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1882  			/* copy rest of data */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1883  			memcpy(buf + (len_in_words =
<< 2), cdns_ctrl->buf,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1884  			       len - (len_in_words =
<< 2));
ec4ba01e894d31 Piotr Sroka 2019-09-26  1885  		}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1886  		return 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1887  	}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1888  =

ec4ba01e894d31 Piotr Sroka 2019-09-26 @1889  	if (cdns_ctrl->dmac && cadenc=
e_nand_dma_buf_ok(cdns_ctrl, buf, len)) {
                                                    ^^^^^^^^^^^^^^^
If this is NULL

ec4ba01e894d31 Piotr Sroka 2019-09-26  1890  		status =3D cadence_nand_slav=
e_dma_transfer(cdns_ctrl, buf,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1891  							 cdns_ctrl->io.dma,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1892  							 len, DMA_FROM_DEVICE);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1893  		if (status =3D=3D 0)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1894  			return 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1895  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1896  		dev_warn(cdns_ctrl->dev,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1897  			 "Slave DMA transfer failed=
. Try again using bounce buffer.");
ec4ba01e894d31 Piotr Sroka 2019-09-26  1898  	}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1899  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1900  	/* If DMA transfer is not pos=
sible or failed then use bounce buffer. */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1901  	status =3D cadence_nand_slave=
_dma_transfer(cdns_ctrl, cdns_ctrl->buf,
                                                                           =
              ^^^^^^^^^
that's a problem because it gets dereferenced inside the function here.

ec4ba01e894d31 Piotr Sroka 2019-09-26  1902  						 cdns_ctrl->io.dma,
ec4ba01e894d31 Piotr Sroka 2019-09-26 @1903  						 sdma_size, DMA_FROM_DEV=
ICE);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1904  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1905  	if (status) {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1906  		dev_err(cdns_ctrl->dev, "Sla=
ve DMA transfer failed");
ec4ba01e894d31 Piotr Sroka 2019-09-26  1907  		return status;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1908  	}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1909  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1910  	memcpy(buf, cdns_ctrl->buf, l=
en);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1911  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1912  	return 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1913  }
ec4ba01e894d31 Piotr Sroka 2019-09-26  1914  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1915  static int cadence_nand_write_=
buf(struct cdns_nand_ctrl *cdns_ctrl,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1916  				  const u8 *buf, int len)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1917  {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1918  	u8 thread_nr =3D 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1919  	u32 sdma_size;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1920  	int status;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1921  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1922  	/* Wait until slave DMA inter=
face is ready to data transfer. */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1923  	status =3D cadence_nand_wait_=
on_sdma(cdns_ctrl, &thread_nr, &sdma_size);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1924  	if (status)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1925  		return status;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1926  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1927  	if (!cdns_ctrl->caps1->has_dm=
a) {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1928  		int len_in_words =3D len >> =
2;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1929  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1930  		iowrite32_rep(cdns_ctrl->io.=
virt, buf, len_in_words);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1931  		if (sdma_size > len) {
ec4ba01e894d31 Piotr Sroka 2019-09-26  1932  			/* copy rest of data */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1933  			memcpy(cdns_ctrl->buf, buf =
+ (len_in_words << 2),
ec4ba01e894d31 Piotr Sroka 2019-09-26  1934  			       len - (len_in_words =
<< 2));
ec4ba01e894d31 Piotr Sroka 2019-09-26  1935  			/* write all expected by na=
nd controller data */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1936  			iowrite32_rep(cdns_ctrl->io=
.virt, cdns_ctrl->buf,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1937  				      sdma_size / 4 - len_=
in_words);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1938  		}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1939  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1940  		return 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1941  	}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1942  =

ec4ba01e894d31 Piotr Sroka 2019-09-26 @1943  	if (cdns_ctrl->dmac && cadenc=
e_nand_dma_buf_ok(cdns_ctrl, buf, len)) {
                                                    ^^^^^^^^^^^^^^^

ec4ba01e894d31 Piotr Sroka 2019-09-26  1944  		status =3D cadence_nand_slav=
e_dma_transfer(cdns_ctrl, (void *)buf,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1945  							 cdns_ctrl->io.dma,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1946  							 len, DMA_TO_DEVICE);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1947  		if (status =3D=3D 0)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1948  			return 0;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1949  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1950  		dev_warn(cdns_ctrl->dev,
ec4ba01e894d31 Piotr Sroka 2019-09-26  1951  			 "Slave DMA transfer failed=
. Try again using bounce buffer.");
ec4ba01e894d31 Piotr Sroka 2019-09-26  1952  	}
ec4ba01e894d31 Piotr Sroka 2019-09-26  1953  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1954  	/* If DMA transfer is not pos=
sible or failed then use bounce buffer. */
ec4ba01e894d31 Piotr Sroka 2019-09-26  1955  	memcpy(cdns_ctrl->buf, buf, l=
en);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1956  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1957  	status =3D cadence_nand_slave=
_dma_transfer(cdns_ctrl, cdns_ctrl->buf,
                                                         ^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^

ec4ba01e894d31 Piotr Sroka 2019-09-26  1958  						 cdns_ctrl->io.dma,
ec4ba01e894d31 Piotr Sroka 2019-09-26 @1959  						 sdma_size, DMA_TO_DEVIC=
E);
ec4ba01e894d31 Piotr Sroka 2019-09-26  1960  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1961  	if (status)
ec4ba01e894d31 Piotr Sroka 2019-09-26  1962  		dev_err(cdns_ctrl->dev, "Sla=
ve DMA transfer failed");
ec4ba01e894d31 Piotr Sroka 2019-09-26  1963  =

ec4ba01e894d31 Piotr Sroka 2019-09-26  1964  	return status;
ec4ba01e894d31 Piotr Sroka 2019-09-26  1965  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============0194520204106948781==--

