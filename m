Content-Type: multipart/mixed; boundary="===============3744207134298091895=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [urjaman:c201-5.9-rc3_v2 13/28] drivers/usb/dwc2/hcd_intr.c:1976:1: sparse: sparse: unused label 'error'
Date: Thu, 03 Sep 2020 06:31:34 +0800
Message-ID: <202009030625.JsPqdvtZ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3744207134298091895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: barzur <boris@konbu.org>
CC: Urja Rannikko <urjaman@gmail.com>

tree:   https://github.com/urjaman/linux c201-5.9-rc3_v2
head:   d9367838cfd73f4d6acef87f5ce1cc99dd167685
commit: 66d64d2a887a1dee90bc14baa1d940919c75d1b4 [13/28] usb/dwc2/hcd: chan=
nel halt may not be an error
:::::: branch date: 3 hours ago
:::::: commit date: 6 hours ago
config: s390-randconfig-s031-20200902 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        git checkout 66d64d2a887a1dee90bc14baa1d940919c75d1b4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/dwc2/hcd_intr.c:1976:1: sparse: sparse: unused label 'error'

# https://github.com/urjaman/linux/commit/66d64d2a887a1dee90bc14baa1d940919=
c75d1b4
git remote add urjaman https://github.com/urjaman/linux
git fetch --no-tags urjaman c201-5.9-rc3_v2
git checkout 66d64d2a887a1dee90bc14baa1d940919c75d1b4
vim +/error +1976 drivers/usb/dwc2/hcd_intr.c

7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1825  =

7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1826  /*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1827   * Handles a host Channel Halted interrupt in DMA mode. This handler
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1828   * determines the reason the channel halted and proceeds accordingl=
y.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1829   */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1830  static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg *hsotg,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1831  				    struct dwc2_host_chan *chan, int chnum,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1832  				    struct dwc2_qtd *qtd)
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1833  {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1834  	u32 hcintmsk;
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1835  	int out_nak_enh =3D 0;
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1836  =

b49977a60dff52 drivers/staging/dwc2/hcd_intr.c Matthijs Kooijman 2013-04-10=
  1837  	if (dbg_hc(chan))
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1838  		dev_vdbg(hsotg->dev,
b49977a60dff52 drivers/staging/dwc2/hcd_intr.c Matthijs Kooijman 2013-04-10=
  1839  			 "--Host Channel %d Interrupt: DMA Channel Halted--\n",
b49977a60dff52 drivers/staging/dwc2/hcd_intr.c Matthijs Kooijman 2013-04-10=
  1840  			 chnum);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1841  =

7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1842  	/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1843  	 * For core with OUT NAK enhancement, the flow for high-speed
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1844  	 * CONTROL/BULK OUT is handled a little differently
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1845  	 */
9badec2f9fa920 drivers/staging/dwc2/hcd_intr.c Matthijs Kooijman 2013-08-30=
  1846  	if (hsotg->hw_params.snpsid >=3D DWC2_CORE_REV_2_71a) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1847  		if (chan->speed =3D=3D USB_SPEED_HIGH && !chan->ep_is_in &&
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1848  		    (chan->ep_type =3D=3D USB_ENDPOINT_XFER_CONTROL ||
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1849  		     chan->ep_type =3D=3D USB_ENDPOINT_XFER_BULK)) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1850  			out_nak_enh =3D 1;
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1851  		}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1852  	}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1853  =

7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1854  	if (chan->halt_status =3D=3D DWC2_HC_XFER_URB_DEQUEUE ||
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1855  	    (chan->halt_status =3D=3D DWC2_HC_XFER_AHB_ERR &&
95832c00bc5ce3 drivers/usb/dwc2/hcd_intr.c     John Youn         2017-01-23=
  1856  	     !hsotg->params.dma_desc_enable)) {
95832c00bc5ce3 drivers/usb/dwc2/hcd_intr.c     John Youn         2017-01-23=
  1857  		if (hsotg->params.dma_desc_enable)
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1858  			dwc2_hcd_complete_xfer_ddma(hsotg, chan, chnum,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1859  						    chan->halt_status);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1860  		else
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1861  			/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1862  			 * Just release the channel. A dequeue can happen on a
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1863  			 * transfer timeout. In the case of an AHB Error, the
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1864  			 * channel was forced to halt because there's no way to
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1865  			 * gracefully recover.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1866  			 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1867  			dwc2_release_channel(hsotg, chan, qtd,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1868  					     chan->halt_status);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1869  		return;
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1870  	}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1871  =

f25c42b8d604fb drivers/usb/dwc2/hcd_intr.c     Gevorg Sahakyan   2018-07-26=
  1872  	hcintmsk =3D dwc2_readl(hsotg, HCINTMSK(chnum));
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1873  =

7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1874  	if (chan->hcint & HCINTMSK_XFERCOMPL) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1875  		/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1876  		 * Todo: This is here because of a possible hardware bug. Spec
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1877  		 * says that on SPLIT-ISOC OUT transfers in DMA mode that a HALT
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1878  		 * interrupt w/ACK bit set should occur, but I only see the
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1879  		 * XFERCOMP bit, even with it masked out. This is a workaround
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1880  		 * for that behavior. Should fix this when hardware is fixed.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1881  		 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1882  		if (chan->ep_type =3D=3D USB_ENDPOINT_XFER_ISOC && !chan->ep_is_i=
n)
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1883  			dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1884  		dwc2_hc_xfercomp_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1885  	} else if (chan->hcint & HCINTMSK_STALL) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1886  		dwc2_hc_stall_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1887  	} else if ((chan->hcint & HCINTMSK_XACTERR) &&
95832c00bc5ce3 drivers/usb/dwc2/hcd_intr.c     John Youn         2017-01-23=
  1888  		   !hsotg->params.dma_desc_enable) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1889  		if (out_nak_enh) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1890  			if (chan->hcint &
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1891  			    (HCINTMSK_NYET | HCINTMSK_NAK | HCINTMSK_ACK)) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1892  				dev_vdbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1893  					 "XactErr with NYET/NAK/ACK\n");
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1894  				qtd->error_count =3D 0;
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1895  			} else {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1896  				dev_vdbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1897  					 "XactErr without NYET/NAK/ACK\n");
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1898  			}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1899  		}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1900  =

7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1901  		/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1902  		 * Must handle xacterr before nak or ack. Could get a xacterr
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1903  		 * at the same time as either of these on a BULK/CONTROL OUT
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1904  		 * that started with a PING. The xacterr takes precedence.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1905  		 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1906  		dwc2_hc_xacterr_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1907  	} else if ((chan->hcint & HCINTMSK_XCS_XACT) &&
95832c00bc5ce3 drivers/usb/dwc2/hcd_intr.c     John Youn         2017-01-23=
  1908  		   hsotg->params.dma_desc_enable) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1909  		dwc2_hc_xacterr_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1910  	} else if ((chan->hcint & HCINTMSK_AHBERR) &&
95832c00bc5ce3 drivers/usb/dwc2/hcd_intr.c     John Youn         2017-01-23=
  1911  		   hsotg->params.dma_desc_enable) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1912  		dwc2_hc_ahberr_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1913  	} else if (chan->hcint & HCINTMSK_BBLERR) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1914  		dwc2_hc_babble_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1915  	} else if (chan->hcint & HCINTMSK_FRMOVRUN) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1916  		dwc2_hc_frmovrun_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1917  	} else if (!out_nak_enh) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1918  		if (chan->hcint & HCINTMSK_NYET) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1919  			/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1920  			 * Must handle nyet before nak or ack. Could get a nyet
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1921  			 * at the same time as either of those on a BULK/CONTROL
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1922  			 * OUT that started with a PING. The nyet takes
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1923  			 * precedence.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1924  			 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1925  			dwc2_hc_nyet_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1926  		} else if ((chan->hcint & HCINTMSK_NAK) &&
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1927  			   !(hcintmsk & HCINTMSK_NAK)) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1928  			/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1929  			 * If nak is not masked, it's because a non-split IN
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1930  			 * transfer is in an error state. In that case, the nak
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1931  			 * is handled by the nak interrupt handler, not here.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1932  			 * Handle nak here for BULK/CONTROL OUT transfers, which
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1933  			 * halt on a NAK to allow rewinding the buffer pointer.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1934  			 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1935  			dwc2_hc_nak_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1936  		} else if ((chan->hcint & HCINTMSK_ACK) &&
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1937  			   !(hcintmsk & HCINTMSK_ACK)) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1938  			/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1939  			 * If ack is not masked, it's because a non-split IN
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1940  			 * transfer is in an error state. In that case, the ack
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1941  			 * is handled by the ack interrupt handler, not here.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1942  			 * Handle ack here for split transfers. Start splits
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1943  			 * halt on ACK.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1944  			 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1945  			dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1946  		} else {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1947  			if (chan->ep_type =3D=3D USB_ENDPOINT_XFER_INT ||
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1948  			    chan->ep_type =3D=3D USB_ENDPOINT_XFER_ISOC) {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1949  				/*
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1950  				 * A periodic transfer halted with no other
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1951  				 * channel interrupts set. Assume it was halted
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1952  				 * by the core because it could not be completed
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1953  				 * in its scheduled (micro)frame.
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1954  				 */
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1955  				dev_dbg(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1956  					"%s: Halt channel %d (assume incomplete periodic transfer)\n",
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1957  					__func__, chnum);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1958  				dwc2_halt_channel(hsotg, chan, qtd,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1959  					DWC2_HC_XFER_PERIODIC_INCOMPLETE);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1960  			} else {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1961  				dev_err(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1962  					"%s: Channel %d - ChHltd set, but reason is unknown\n",
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1963  					__func__, chnum);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1964  				dev_err(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1965  					"hcint 0x%08x, intsts 0x%08x\n",
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1966  					chan->hcint,
f25c42b8d604fb drivers/usb/dwc2/hcd_intr.c     Gevorg Sahakyan   2018-07-26=
  1967  					dwc2_readl(hsotg, GINTSTS));
66d64d2a887a1d drivers/usb/dwc2/hcd_intr.c     barzur            2019-07-12=
  1968  				dwc2_halt_channel(hsotg, chan, qtd,
66d64d2a887a1d drivers/usb/dwc2/hcd_intr.c     barzur            2019-07-12=
  1969  					DWC2_HC_XFER_PERIODIC_INCOMPLETE);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1970  			}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1971  		}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1972  	} else {
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1973  		dev_info(hsotg->dev,
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1974  			 "NYET/NAK/ACK/other in non-error case, 0x%08x\n",
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1975  			 chan->hcint);
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
 @1976  error:
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
  1977  		/* Failthrough: use 3-strikes rule */
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
  1978  		qtd->error_count++;
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
  1979  		dwc2_update_urb_state_abn(hsotg, chan, chnum, qtd->urb,
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
  1980  					  qtd, DWC2_HC_XFER_XACT_ERR);
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
  1981  		dwc2_hcd_save_data_toggle(hsotg, chan, chnum, qtd);
151d0cbdbe8609 drivers/usb/dwc2/hcd_intr.c     Nick Hudson       2014-09-11=
  1982  		dwc2_halt_channel(hsotg, chan, qtd, DWC2_HC_XFER_XACT_ERR);
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1983  	}
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1984  }
7359d482eb4d39 drivers/staging/dwc2/hcd_intr.c Paul Zimmerman    2013-03-11=
  1985  =


:::::: The code at line 1976 was first introduced by commit
:::::: 151d0cbdbe8609e8489d10ddb7aed6e431fe6b5d usb: dwc2: make the schedul=
er handle excessive NAKs better

:::::: TO: Nick Hudson <skrll@netbsd.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3744207134298091895==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Kv0Qtoci+CzGRfFKcsPxH8M0Cbbb9wEA
--===============3744207134298091895==--

