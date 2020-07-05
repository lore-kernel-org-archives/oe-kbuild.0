Content-Type: multipart/mixed; boundary="===============6670259854584638771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap-audio:peter/ti-linux-5.4.y/wip 2/27] drivers/dma/ti/edma.c:1995:31: warning: Possible null pointer dereference: m_ddev
Date: Sun, 05 Jul 2020 16:28:34 +0800
Message-ID: <202007051623.SiJESbj0%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6670259854584638771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-5.4.y/wip
head:   c10b4d1b6f2c74e568ed71ba10ad35702a01eb88
commit: cc41d908a672d6d704ad986162e1c71df48ed619 [2/27] dmaengine: ti: edma=
: Support for interleaved mem to mem transfer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma/ti/edma.c:1995:31: warning: Possible null pointer dereferenc=
e: m_ddev [nullPointer]
     dma_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
                                 ^
   drivers/dma/ti/edma.c:1983:30: note: Assignment 'm_ddev=3DNULL', assigne=
d value is 0
    struct dma_device *m_ddev =3D NULL;
                                ^
   drivers/dma/ti/edma.c:1995:31: note: Null pointer dereference
     dma_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
                                 ^

# https://github.com/omap-audio/linux-audio/commit/cc41d908a672d6d704ad9861=
62e1c71df48ed619
git remote add omap-audio https://github.com/omap-audio/linux-audio
git remote update omap-audio
git checkout cc41d908a672d6d704ad986162e1c71df48ed619
vim +1995 drivers/dma/ti/edma.c

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1974  =

02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1975  #defi=
ne EDMA_DMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1976  				 =
BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1977  				 =
BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1978  				 =
BIT(DMA_SLAVE_BUSWIDTH_4_BYTES))
02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1979  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1980  stati=
c void edma_dma_init(struct edma_cc *ecc, bool legacy_mode)
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  1981  {
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1982  	stru=
ct dma_device *s_ddev =3D &ecc->dma_slave;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1983  	stru=
ct dma_device *m_ddev =3D NULL;
ecb7deceff2a51 drivers/dma/edma.c    Peter Ujfalusi 2015-12-09  1984  	s32 =
*memcpy_channels =3D ecc->info->memcpy_channels;
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  1985  	int =
i, j;
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  1986  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1987  	dma_=
cap_zero(s_ddev->cap_mask);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1988  	dma_=
cap_set(DMA_SLAVE, s_ddev->cap_mask);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1989  	dma_=
cap_set(DMA_CYCLIC, s_ddev->cap_mask);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1990  	if (=
ecc->legacy_mode && !memcpy_channels) {
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1991  		dev=
_warn(ecc->dev,
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1992  			 "=
Legacy memcpy is enabled, things might not work\n");
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1993  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1994  		dma=
_cap_set(DMA_MEMCPY, s_ddev->cap_mask);
cc41d908a672d6 drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07 @1995  		dma=
_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1996  		s_d=
dev->device_prep_dma_memcpy =3D edma_prep_dma_memcpy;
cc41d908a672d6 drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07  1997  		s_d=
dev->device_prep_interleaved_dma =3D edma_prep_dma_interleaved;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1998  		s_d=
dev->directions =3D BIT(DMA_MEM_TO_MEM);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1999  	}
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2000  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2001  	s_dd=
ev->device_prep_slave_sg =3D edma_prep_slave_sg;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2002  	s_dd=
ev->device_prep_dma_cyclic =3D edma_prep_dma_cyclic;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2003  	s_dd=
ev->device_alloc_chan_resources =3D edma_alloc_chan_resources;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2004  	s_dd=
ev->device_free_chan_resources =3D edma_free_chan_resources;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2005  	s_dd=
ev->device_issue_pending =3D edma_issue_pending;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2006  	s_dd=
ev->device_tx_status =3D edma_tx_status;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2007  	s_dd=
ev->device_config =3D edma_slave_config;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2008  	s_dd=
ev->device_pause =3D edma_dma_pause;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2009  	s_dd=
ev->device_resume =3D edma_dma_resume;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2010  	s_dd=
ev->device_terminate_all =3D edma_terminate_all;
b84730ffcfccbe drivers/dma/edma.c    Peter Ujfalusi 2016-02-11  2011  	s_dd=
ev->device_synchronize =3D edma_synchronize;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2012  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2013  	s_dd=
ev->src_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2014  	s_dd=
ev->dst_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2015  	s_dd=
ev->directions |=3D (BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV));
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2016  	s_dd=
ev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;
ea09ea51ddb9c5 drivers/dma/edma.c    Peter Ujfalusi 2017-10-03  2017  	s_dd=
ev->max_burst =3D SZ_32K - 1; /* CIDX: 16bit signed */
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2018  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2019  	s_dd=
ev->dev =3D ecc->dev;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2020  	INIT=
_LIST_HEAD(&s_ddev->channels);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2021  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2022  	if (=
memcpy_channels) {
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2023  		m_d=
dev =3D devm_kzalloc(ecc->dev, sizeof(*m_ddev), GFP_KERNEL);
f31b323675c11e drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2024  		if =
(!m_ddev) {
f31b323675c11e drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2025  			de=
v_warn(ecc->dev, "memcpy is disabled due to OoM\n");
f31b323675c11e drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2026  			me=
mcpy_channels =3D NULL;
f31b323675c11e drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2027  			go=
to ch_setup;
f31b323675c11e drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2028  		}
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2029  		ecc=
->dma_memcpy =3D m_ddev;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2030  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2031  		dma=
_cap_zero(m_ddev->cap_mask);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2032  		dma=
_cap_set(DMA_MEMCPY, m_ddev->cap_mask);
cc41d908a672d6 drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07  2033  		dma=
_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2034  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2035  		m_d=
dev->device_prep_dma_memcpy =3D edma_prep_dma_memcpy;
cc41d908a672d6 drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07  2036  		m_d=
dev->device_prep_interleaved_dma =3D edma_prep_dma_interleaved;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2037  		m_d=
dev->device_alloc_chan_resources =3D edma_alloc_chan_resources;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2038  		m_d=
dev->device_free_chan_resources =3D edma_free_chan_resources;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2039  		m_d=
dev->device_issue_pending =3D edma_issue_pending;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2040  		m_d=
dev->device_tx_status =3D edma_tx_status;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2041  		m_d=
dev->device_config =3D edma_slave_config;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2042  		m_d=
dev->device_pause =3D edma_dma_pause;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2043  		m_d=
dev->device_resume =3D edma_dma_resume;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2044  		m_d=
dev->device_terminate_all =3D edma_terminate_all;
b84730ffcfccbe drivers/dma/edma.c    Peter Ujfalusi 2016-02-11  2045  		m_d=
dev->device_synchronize =3D edma_synchronize;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2046  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2047  		m_d=
dev->src_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2048  		m_d=
dev->dst_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2049  		m_d=
dev->directions =3D BIT(DMA_MEM_TO_MEM);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2050  		m_d=
dev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2051  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2052  		m_d=
dev->dev =3D ecc->dev;
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2053  		INI=
T_LIST_HEAD(&m_ddev->channels);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2054  	} el=
se if (!ecc->legacy_mode) {
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2055  		dev=
_info(ecc->dev, "memcpy is disabled\n");
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2056  	}
02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2057  =

f31b323675c11e drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2058  ch_se=
tup:
cb78205955d4a2 drivers/dma/edma.c    Peter Ujfalusi 2015-10-14  2059  	for =
(i =3D 0; i < ecc->num_channels; i++) {
02f77ef1197bd0 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2060  		str=
uct edma_chan *echan =3D &ecc->slave_chans[i];
2b6b3b74201908 drivers/dma/edma.c    Peter Ujfalusi 2015-10-14  2061  		ech=
an->ch_num =3D EDMA_CTLR_CHAN(ecc->id, i);
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2062  		ech=
an->ecc =3D ecc;
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2063  		ech=
an->vchan.desc_free =3D edma_desc_free;
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2064  =

1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2065  		if =
(m_ddev && edma_is_memcpy_channel(i, memcpy_channels))
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2066  			vc=
han_init(&echan->vchan, m_ddev);
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2067  		else
1be5336bc7ba05 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2068  			vc=
han_init(&echan->vchan, s_ddev);
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2069  =

c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2070  		INI=
T_LIST_HEAD(&echan->node);
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2071  		for=
 (j =3D 0; j < EDMA_MAX_SLOTS; j++)
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2072  			ec=
han->slot[j] =3D -1;
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2073  	}
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2074  }
c2dde5f8f2095d drivers/dma/edma.c    Matt Porter    2012-08-22  2075  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6670259854584638771==--

