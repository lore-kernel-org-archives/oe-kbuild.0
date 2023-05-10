Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5012B7E
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683724295; x=1715260295;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BryTmTpKdvN/DgcAbmlt0iuv2mjFg+WJmCc7c73gZrU=;
  b=nIUbsz58QymISZILtcUwpyqLtO6YBBH8+JmCxT445BBs+doDgkPLrh2Z
   hMbN0J221lzN//NbRlJL02YOPkzgUpRPtbAtck3y96ElTwOK7Qf6GtfJl
   RJiXzVozni3J+zMjIOifXgrvlqf2k0JRloPuKlMCxey50d5XFInkDNywb
   rkFtTyC7kcTX5IXrwN/87js6Q4jovNVzcYkVlOZk1ahGo4BtEH5+u/wH3
   dVx08J2QTGRxCGzBKYzOaLskdvU3N362OlBvq78wljNhhfanpN2XItruP
   jROCyeL/fRfTJbe30WkQunVI7l6l0ogCO2Sv43RIolP81aMgR15fK4Gru
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436533325"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="436533325"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768909368"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="768909368"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 06:11:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwjbP-0003J6-0Z;
	Wed, 10 May 2023 13:11:31 +0000
Date: Wed, 10 May 2023 21:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mnyman-xhci:for-usb-next 10/11] drivers/usb/host/xhci-mem.c:2040
 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.
Message-ID: <202305102129.39U7mZoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
head:   de6fcb4b6f1c55298b3ed0dd3d43961f86aa1b12
commit: efcf3bab0767e057d8727b9a211fbb4fb4cdc81e [10/11] xhci: Show ZHAOXIN xHCI root hub speed correctly
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230510/202305102129.39U7mZoj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305102129.39U7mZoj-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-mem.c:2040 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.

vim +/tmp_minor_revision +2040 drivers/usb/host/xhci-mem.c

257d585aaec469 Sarah Sharp      2010-07-29  1958  
da6699ce4a889c Sarah Sharp      2010-10-26  1959  static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
d5ddcdf4d672fd Mathias Nyman    2015-11-24  1960  		__le32 __iomem *addr, int max_caps)
da6699ce4a889c Sarah Sharp      2010-10-26  1961  {
da6699ce4a889c Sarah Sharp      2010-10-26  1962  	u32 temp, port_offset, port_count;
da6699ce4a889c Sarah Sharp      2010-10-26  1963  	int i;
efcf3bab0767e0 Weitao Wang      2023-05-09  1964  	u8 major_revision, minor_revision, tmp_minor_revision;
47189098f8bebe Mathias Nyman    2015-10-01  1965  	struct xhci_hub *rhub;
a965315e59f3cb Adam Wallis      2018-05-22  1966  	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
cf0ee7c60c8964 Mathias Nyman    2020-02-11  1967  	struct xhci_port_cap *port_cap;
da6699ce4a889c Sarah Sharp      2010-10-26  1968  
47189098f8bebe Mathias Nyman    2015-10-01  1969  	temp = readl(addr);
d5ddcdf4d672fd Mathias Nyman    2015-11-24  1970  	major_revision = XHCI_EXT_PORT_MAJOR(temp);
b72eb8435b25be YD Tseng         2017-06-09  1971  	minor_revision = XHCI_EXT_PORT_MINOR(temp);
47189098f8bebe Mathias Nyman    2015-10-01  1972  
d5ddcdf4d672fd Mathias Nyman    2015-11-24  1973  	if (major_revision == 0x03) {
47189098f8bebe Mathias Nyman    2015-10-01  1974  		rhub = &xhci->usb3_rhub;
64364bc912c01b Thinh Nguyen     2021-03-10  1975  		/*
64364bc912c01b Thinh Nguyen     2021-03-10  1976  		 * Some hosts incorrectly use sub-minor version for minor
64364bc912c01b Thinh Nguyen     2021-03-10  1977  		 * version (i.e. 0x02 instead of 0x20 for bcdUSB 0x320 and 0x01
64364bc912c01b Thinh Nguyen     2021-03-10  1978  		 * for bcdUSB 0x310). Since there is no USB release with sub
64364bc912c01b Thinh Nguyen     2021-03-10  1979  		 * minor version 0x301 to 0x309, we can assume that they are
64364bc912c01b Thinh Nguyen     2021-03-10  1980  		 * incorrect and fix it here.
64364bc912c01b Thinh Nguyen     2021-03-10  1981  		 */
64364bc912c01b Thinh Nguyen     2021-03-10  1982  		if (minor_revision > 0x00 && minor_revision < 0x10)
64364bc912c01b Thinh Nguyen     2021-03-10  1983  			minor_revision <<= 4;
efcf3bab0767e0 Weitao Wang      2023-05-09  1984  		/*
efcf3bab0767e0 Weitao Wang      2023-05-09  1985  		 * Some zhaoxin's xHCI controller that follow usb3.1 spec
efcf3bab0767e0 Weitao Wang      2023-05-09  1986  		 * but only support Gen1.
efcf3bab0767e0 Weitao Wang      2023-05-09  1987  		 */
efcf3bab0767e0 Weitao Wang      2023-05-09  1988  		if (xhci->quirks & XHCI_ZHAOXIN_HOST) {
efcf3bab0767e0 Weitao Wang      2023-05-09  1989  			tmp_minor_revision = minor_revision;
efcf3bab0767e0 Weitao Wang      2023-05-09  1990  			minor_revision = 0;
efcf3bab0767e0 Weitao Wang      2023-05-09  1991  		}
efcf3bab0767e0 Weitao Wang      2023-05-09  1992  
d5ddcdf4d672fd Mathias Nyman    2015-11-24  1993  	} else if (major_revision <= 0x02) {
47189098f8bebe Mathias Nyman    2015-10-01  1994  		rhub = &xhci->usb2_rhub;
47189098f8bebe Mathias Nyman    2015-10-01  1995  	} else {
4feb07d0ada339 Andy Shevchenko  2023-03-17  1996  		xhci_warn(xhci, "Ignoring unknown port speed, Ext Cap %p, revision = 0x%x\n",
da6699ce4a889c Sarah Sharp      2010-10-26  1997  				addr, major_revision);
da6699ce4a889c Sarah Sharp      2010-10-26  1998  		/* Ignoring port protocol we can't understand. FIXME */
da6699ce4a889c Sarah Sharp      2010-10-26  1999  		return;
da6699ce4a889c Sarah Sharp      2010-10-26  2000  	}
da6699ce4a889c Sarah Sharp      2010-10-26  2001  
da6699ce4a889c Sarah Sharp      2010-10-26  2002  	/* Port offset and count in the third dword, see section 7.2 */
b0ba9720846c98 Xenia Ragiadakou 2013-11-15  2003  	temp = readl(addr + 2);
da6699ce4a889c Sarah Sharp      2010-10-26  2004  	port_offset = XHCI_EXT_PORT_OFF(temp);
da6699ce4a889c Sarah Sharp      2010-10-26  2005  	port_count = XHCI_EXT_PORT_COUNT(temp);
d195fcffe4c82c Xenia Ragiadakou 2013-08-14  2006  	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
4feb07d0ada339 Andy Shevchenko  2023-03-17  2007  		       "Ext Cap %p, port offset = %u, count = %u, revision = 0x%x",
da6699ce4a889c Sarah Sharp      2010-10-26  2008  		       addr, port_offset, port_count, major_revision);
da6699ce4a889c Sarah Sharp      2010-10-26  2009  	/* Port count includes the current port offset */
da6699ce4a889c Sarah Sharp      2010-10-26  2010  	if (port_offset == 0 || (port_offset + port_count - 1) > num_ports)
da6699ce4a889c Sarah Sharp      2010-10-26  2011  		/* WTF? "Valid values are ‘1’ to MaxPorts" */
da6699ce4a889c Sarah Sharp      2010-10-26  2012  		return;
fc71ff7583b143 Andiry Xu        2011-09-23  2013  
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2014  	port_cap = &xhci->port_caps[xhci->num_port_caps++];
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2015  	if (xhci->num_port_caps > max_caps)
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2016  		return;
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2017  
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2018  	port_cap->psi_count = XHCI_EXT_PORT_PSIC(temp);
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2019  
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2020  	if (port_cap->psi_count) {
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2021  		port_cap->psi = kcalloc_node(port_cap->psi_count,
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2022  					     sizeof(*port_cap->psi),
a965315e59f3cb Adam Wallis      2018-05-22  2023  					     GFP_KERNEL, dev_to_node(dev));
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2024  		if (!port_cap->psi)
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2025  			port_cap->psi_count = 0;
47189098f8bebe Mathias Nyman    2015-10-01  2026  
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2027  		port_cap->psi_uid_count++;
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2028  		for (i = 0; i < port_cap->psi_count; i++) {
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2029  			port_cap->psi[i] = readl(addr + 4 + i);
47189098f8bebe Mathias Nyman    2015-10-01  2030  
47189098f8bebe Mathias Nyman    2015-10-01  2031  			/* count unique ID values, two consecutive entries can
47189098f8bebe Mathias Nyman    2015-10-01  2032  			 * have the same ID if link is assymetric
47189098f8bebe Mathias Nyman    2015-10-01  2033  			 */
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2034  			if (i && (XHCI_EXT_PORT_PSIV(port_cap->psi[i]) !=
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2035  				  XHCI_EXT_PORT_PSIV(port_cap->psi[i - 1])))
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2036  				port_cap->psi_uid_count++;
47189098f8bebe Mathias Nyman    2015-10-01  2037  
efcf3bab0767e0 Weitao Wang      2023-05-09  2038  			if (xhci->quirks & XHCI_ZHAOXIN_HOST &&
efcf3bab0767e0 Weitao Wang      2023-05-09  2039  					XHCI_EXT_PORT_PSIV(port_cap->psi[i]) >= 5)
efcf3bab0767e0 Weitao Wang      2023-05-09 @2040  				minor_revision = tmp_minor_revision;
efcf3bab0767e0 Weitao Wang      2023-05-09  2041  
47189098f8bebe Mathias Nyman    2015-10-01  2042  			xhci_dbg(xhci, "PSIV:%d PSIE:%d PLT:%d PFD:%d LP:%d PSIM:%d\n",
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2043  				  XHCI_EXT_PORT_PSIV(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2044  				  XHCI_EXT_PORT_PSIE(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2045  				  XHCI_EXT_PORT_PLT(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2046  				  XHCI_EXT_PORT_PFD(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2047  				  XHCI_EXT_PORT_LP(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2048  				  XHCI_EXT_PORT_PSIM(port_cap->psi[i]));
47189098f8bebe Mathias Nyman    2015-10-01  2049  		}
47189098f8bebe Mathias Nyman    2015-10-01  2050  	}
efcf3bab0767e0 Weitao Wang      2023-05-09  2051  
efcf3bab0767e0 Weitao Wang      2023-05-09  2052  	rhub->maj_rev = major_revision;
efcf3bab0767e0 Weitao Wang      2023-05-09  2053  
efcf3bab0767e0 Weitao Wang      2023-05-09  2054  	if (rhub->min_rev < minor_revision)
efcf3bab0767e0 Weitao Wang      2023-05-09  2055  		rhub->min_rev = minor_revision;
efcf3bab0767e0 Weitao Wang      2023-05-09  2056  
efcf3bab0767e0 Weitao Wang      2023-05-09  2057  	port_cap->maj_rev = major_revision;
efcf3bab0767e0 Weitao Wang      2023-05-09  2058  	port_cap->min_rev = minor_revision;
efcf3bab0767e0 Weitao Wang      2023-05-09  2059  
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2060  	/* cache usb2 port capabilities */
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2061  	if (major_revision < 0x03 && xhci->num_ext_caps < max_caps)
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2062  		xhci->ext_caps[xhci->num_ext_caps++] = temp;
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2063  
f1fd62a6b6c62e Zeng Tao         2018-12-07  2064  	if ((xhci->hci_version >= 0x100) && (major_revision != 0x03) &&
f1fd62a6b6c62e Zeng Tao         2018-12-07  2065  		 (temp & XHCI_HLC)) {
d195fcffe4c82c Xenia Ragiadakou 2013-08-14  2066  		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
d195fcffe4c82c Xenia Ragiadakou 2013-08-14  2067  			       "xHCI 1.0: support USB2 hardware lpm");
fc71ff7583b143 Andiry Xu        2011-09-23  2068  		xhci->hw_lpm_support = 1;
fc71ff7583b143 Andiry Xu        2011-09-23  2069  	}
fc71ff7583b143 Andiry Xu        2011-09-23  2070  
da6699ce4a889c Sarah Sharp      2010-10-26  2071  	port_offset--;
da6699ce4a889c Sarah Sharp      2010-10-26  2072  	for (i = port_offset; i < (port_offset + port_count); i++) {
bcaa9d5c59005e Mathias Nyman    2018-05-21  2073  		struct xhci_port *hw_port = &xhci->hw_ports[i];
da6699ce4a889c Sarah Sharp      2010-10-26  2074  		/* Duplicate entry.  Ignore the port if the revisions differ. */
07f7619053874b Mathias Nyman    2018-05-21  2075  		if (hw_port->rhub) {
4feb07d0ada339 Andy Shevchenko  2023-03-17  2076  			xhci_warn(xhci, "Duplicate port entry, Ext Cap %p, port %u\n", addr, i);
4feb07d0ada339 Andy Shevchenko  2023-03-17  2077  			xhci_warn(xhci, "Port was marked as USB %u, duplicated as USB %u\n",
07f7619053874b Mathias Nyman    2018-05-21  2078  					hw_port->rhub->maj_rev, major_revision);
da6699ce4a889c Sarah Sharp      2010-10-26  2079  			/* Only adjust the roothub port counts if we haven't
da6699ce4a889c Sarah Sharp      2010-10-26  2080  			 * found a similar duplicate.
da6699ce4a889c Sarah Sharp      2010-10-26  2081  			 */
bcaa9d5c59005e Mathias Nyman    2018-05-21  2082  			if (hw_port->rhub != rhub &&
bcaa9d5c59005e Mathias Nyman    2018-05-21  2083  				 hw_port->hcd_portnum != DUPLICATE_ENTRY) {
bcaa9d5c59005e Mathias Nyman    2018-05-21  2084  				hw_port->rhub->num_ports--;
bcaa9d5c59005e Mathias Nyman    2018-05-21  2085  				hw_port->hcd_portnum = DUPLICATE_ENTRY;
bcaa9d5c59005e Mathias Nyman    2018-05-21  2086  			}
f8bbeabc34aa94 Sarah Sharp      2010-12-09  2087  			continue;
da6699ce4a889c Sarah Sharp      2010-10-26  2088  		}
bcaa9d5c59005e Mathias Nyman    2018-05-21  2089  		hw_port->rhub = rhub;
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2090  		hw_port->port_cap = port_cap;
bcaa9d5c59005e Mathias Nyman    2018-05-21  2091  		rhub->num_ports++;
da6699ce4a889c Sarah Sharp      2010-10-26  2092  	}
da6699ce4a889c Sarah Sharp      2010-10-26  2093  	/* FIXME: Should we disable ports not in the Extended Capabilities? */
da6699ce4a889c Sarah Sharp      2010-10-26  2094  }
da6699ce4a889c Sarah Sharp      2010-10-26  2095  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
