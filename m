Content-Type: multipart/mixed; boundary="===============2350327177520527367=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap-audio:peter/ti-linux-5.4.y/wip 1/8] drivers/dma/ti/edma.c:1995:31: warning: Possible null pointer dereference: m_ddev
Date: Thu, 17 Dec 2020 12:29:52 +0800
Message-ID: <202012171242.kjOuOaMe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2350327177520527367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-5.4.y/wip
head:   811881219cd003d339f85c53a6e6b3c9ea63bd48
commit: a1c1ce2045955be25e8f9905202fcaa9db6f14d6 [1/8] dmaengine: ti: edma:=
 Support for interleaved mem to mem transfer
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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

vim +1995 drivers/dma/ti/edma.c

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1974  =

02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1975  #def=
ine EDMA_DMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1976  				=
 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1977  				=
 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1978  				=
 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES))
02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1979  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1980  stat=
ic void edma_dma_init(struct edma_cc *ecc, bool legacy_mode)
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  1981  {
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1982  	str=
uct dma_device *s_ddev =3D &ecc->dma_slave;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1983  	str=
uct dma_device *m_ddev =3D NULL;
ecb7deceff2a51d drivers/dma/edma.c    Peter Ujfalusi 2015-12-09  1984  	s32=
 *memcpy_channels =3D ecc->info->memcpy_channels;
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  1985  	int=
 i, j;
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  1986  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1987  	dma=
_cap_zero(s_ddev->cap_mask);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1988  	dma=
_cap_set(DMA_SLAVE, s_ddev->cap_mask);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1989  	dma=
_cap_set(DMA_CYCLIC, s_ddev->cap_mask);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1990  	if =
(ecc->legacy_mode && !memcpy_channels) {
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1991  		de=
v_warn(ecc->dev,
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1992  			 =
"Legacy memcpy is enabled, things might not work\n");
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1993  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1994  		dm=
a_cap_set(DMA_MEMCPY, s_ddev->cap_mask);
a1c1ce2045955be drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07 @1995  		dm=
a_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1996  		s_=
ddev->device_prep_dma_memcpy =3D edma_prep_dma_memcpy;
a1c1ce2045955be drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07  1997  		s_=
ddev->device_prep_interleaved_dma =3D edma_prep_dma_interleaved;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1998  		s_=
ddev->directions =3D BIT(DMA_MEM_TO_MEM);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  1999  	}
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2000  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2001  	s_d=
dev->device_prep_slave_sg =3D edma_prep_slave_sg;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2002  	s_d=
dev->device_prep_dma_cyclic =3D edma_prep_dma_cyclic;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2003  	s_d=
dev->device_alloc_chan_resources =3D edma_alloc_chan_resources;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2004  	s_d=
dev->device_free_chan_resources =3D edma_free_chan_resources;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2005  	s_d=
dev->device_issue_pending =3D edma_issue_pending;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2006  	s_d=
dev->device_tx_status =3D edma_tx_status;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2007  	s_d=
dev->device_config =3D edma_slave_config;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2008  	s_d=
dev->device_pause =3D edma_dma_pause;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2009  	s_d=
dev->device_resume =3D edma_dma_resume;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2010  	s_d=
dev->device_terminate_all =3D edma_terminate_all;
b84730ffcfccbed drivers/dma/edma.c    Peter Ujfalusi 2016-02-11  2011  	s_d=
dev->device_synchronize =3D edma_synchronize;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2012  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2013  	s_d=
dev->src_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2014  	s_d=
dev->dst_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2015  	s_d=
dev->directions |=3D (BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV));
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2016  	s_d=
dev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;
ea09ea51ddb9c50 drivers/dma/edma.c    Peter Ujfalusi 2017-10-03  2017  	s_d=
dev->max_burst =3D SZ_32K - 1; /* CIDX: 16bit signed */
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2018  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2019  	s_d=
dev->dev =3D ecc->dev;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2020  	INI=
T_LIST_HEAD(&s_ddev->channels);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2021  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2022  	if =
(memcpy_channels) {
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2023  		m_=
ddev =3D devm_kzalloc(ecc->dev, sizeof(*m_ddev), GFP_KERNEL);
f31b323675c11e4 drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2024  		if=
 (!m_ddev) {
f31b323675c11e4 drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2025  			d=
ev_warn(ecc->dev, "memcpy is disabled due to OoM\n");
f31b323675c11e4 drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2026  			m=
emcpy_channels =3D NULL;
f31b323675c11e4 drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2027  			g=
oto ch_setup;
f31b323675c11e4 drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2028  		}
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2029  		ec=
c->dma_memcpy =3D m_ddev;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2030  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2031  		dm=
a_cap_zero(m_ddev->cap_mask);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2032  		dm=
a_cap_set(DMA_MEMCPY, m_ddev->cap_mask);
a1c1ce2045955be drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07  2033  		dm=
a_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2034  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2035  		m_=
ddev->device_prep_dma_memcpy =3D edma_prep_dma_memcpy;
a1c1ce2045955be drivers/dma/ti/edma.c Peter Ujfalusi 2020-02-07  2036  		m_=
ddev->device_prep_interleaved_dma =3D edma_prep_dma_interleaved;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2037  		m_=
ddev->device_alloc_chan_resources =3D edma_alloc_chan_resources;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2038  		m_=
ddev->device_free_chan_resources =3D edma_free_chan_resources;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2039  		m_=
ddev->device_issue_pending =3D edma_issue_pending;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2040  		m_=
ddev->device_tx_status =3D edma_tx_status;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2041  		m_=
ddev->device_config =3D edma_slave_config;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2042  		m_=
ddev->device_pause =3D edma_dma_pause;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2043  		m_=
ddev->device_resume =3D edma_dma_resume;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2044  		m_=
ddev->device_terminate_all =3D edma_terminate_all;
b84730ffcfccbed drivers/dma/edma.c    Peter Ujfalusi 2016-02-11  2045  		m_=
ddev->device_synchronize =3D edma_synchronize;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2046  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2047  		m_=
ddev->src_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2048  		m_=
ddev->dst_addr_widths =3D EDMA_DMA_BUSWIDTHS;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2049  		m_=
ddev->directions =3D BIT(DMA_MEM_TO_MEM);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2050  		m_=
ddev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2051  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2052  		m_=
ddev->dev =3D ecc->dev;
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2053  		IN=
IT_LIST_HEAD(&m_ddev->channels);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2054  	} e=
lse if (!ecc->legacy_mode) {
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2055  		de=
v_info(ecc->dev, "memcpy is disabled\n");
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2056  	}
02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2057  =

f31b323675c11e4 drivers/dma/edma.c    Peter Ujfalusi 2018-03-21  2058  ch_s=
etup:
cb78205955d4a2c drivers/dma/edma.c    Peter Ujfalusi 2015-10-14  2059  	for=
 (i =3D 0; i < ecc->num_channels; i++) {
02f77ef1197bd0a drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2060  		st=
ruct edma_chan *echan =3D &ecc->slave_chans[i];
2b6b3b742019088 drivers/dma/edma.c    Peter Ujfalusi 2015-10-14  2061  		ec=
han->ch_num =3D EDMA_CTLR_CHAN(ecc->id, i);
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2062  		ec=
han->ecc =3D ecc;
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2063  		ec=
han->vchan.desc_free =3D edma_desc_free;
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2064  =

1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2065  		if=
 (m_ddev && edma_is_memcpy_channel(i, memcpy_channels))
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2066  			v=
chan_init(&echan->vchan, m_ddev);
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2067  		el=
se
1be5336bc7ba050 drivers/dma/edma.c    Peter Ujfalusi 2015-10-16  2068  			v=
chan_init(&echan->vchan, s_ddev);
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2069  =

c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2070  		IN=
IT_LIST_HEAD(&echan->node);
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2071  		fo=
r (j =3D 0; j < EDMA_MAX_SLOTS; j++)
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2072  			e=
chan->slot[j] =3D -1;
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2073  	}
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2074  }
c2dde5f8f2095d7 drivers/dma/edma.c    Matt Porter    2012-08-22  2075  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2350327177520527367==--

