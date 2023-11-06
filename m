Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82764EB8
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 03:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZaq8Cfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699240453; x=1730776453;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7REayt6iwR+LA/RMrIDDSfuFgTAePvdnu14ecANsYow=;
  b=UZaq8CfbnryvYIdGAOYZPsIMEo6C9VF+L2zTyFXzHK39FqCNZD6mu+UL
   ObrPoh3AKyGYPbpobi/BuhjlCfSvNeC8ea5JniWS6sl880K0E9Yry1tkg
   T1RceteAsd8SdPXz+huSU7FFIr49+KtYWQhWIaohtVlz5dTjzM4mnrImC
   jNbRrect4bEf4f1IdDwWn6mMVLFZDzbP+h52l2V34K8TNFYSbVXXSy02x
   RaRkwrA63VwUf6QS/Ch9YcNreErXC6IIC2JLo9FKgx074N7OihG6VmRmE
   WRxUeEuZFQk3uBQpttoucQlNB/Ykl8f8541nvp79YW+0inwwfyLUN0kDO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393097131"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="393097131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 19:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3314524"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2023 19:14:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzq41-00063n-0s;
	Mon, 06 Nov 2023 03:14:09 +0000
Date: Mon, 6 Nov 2023 11:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/host/xhci-mem.c:2041 xhci_add_in_port() error:
 uninitialized symbol 'tmp_minor_revision'.
Message-ID: <202311061052.nzIDbezO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: d9b0328d0b8b8298dfdc97cd8e0e2371d4bcc97b xhci: Show ZHAOXIN xHCI root hub speed correctly
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20231016 (https://download.01.org/0day-ci/archive/20231106/202311061052.nzIDbezO-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061052.nzIDbezO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061052.nzIDbezO-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-mem.c:2041 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.

vim +/tmp_minor_revision +2041 drivers/usb/host/xhci-mem.c

257d585aaec469 Sarah Sharp      2010-07-29  1958  
da6699ce4a889c Sarah Sharp      2010-10-26  1959  static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
d5ddcdf4d672fd Mathias Nyman    2015-11-24  1960  		__le32 __iomem *addr, int max_caps)
da6699ce4a889c Sarah Sharp      2010-10-26  1961  {
da6699ce4a889c Sarah Sharp      2010-10-26  1962  	u32 temp, port_offset, port_count;
da6699ce4a889c Sarah Sharp      2010-10-26  1963  	int i;
d9b0328d0b8b82 Weitao Wang      2023-06-02  1964  	u8 major_revision, minor_revision, tmp_minor_revision;
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
d9b0328d0b8b82 Weitao Wang      2023-06-02  1984  		/*
d9b0328d0b8b82 Weitao Wang      2023-06-02  1985  		 * Some zhaoxin's xHCI controller that follow usb3.1 spec
d9b0328d0b8b82 Weitao Wang      2023-06-02  1986  		 * but only support Gen1.
d9b0328d0b8b82 Weitao Wang      2023-06-02  1987  		 */
d9b0328d0b8b82 Weitao Wang      2023-06-02  1988  		if (xhci->quirks & XHCI_ZHAOXIN_HOST) {
d9b0328d0b8b82 Weitao Wang      2023-06-02  1989  			tmp_minor_revision = minor_revision;
d9b0328d0b8b82 Weitao Wang      2023-06-02  1990  			minor_revision = 0;
d9b0328d0b8b82 Weitao Wang      2023-06-02  1991  		}
d9b0328d0b8b82 Weitao Wang      2023-06-02  1992  
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
d9b0328d0b8b82 Weitao Wang      2023-06-02  2038  			if (xhci->quirks & XHCI_ZHAOXIN_HOST &&
d9b0328d0b8b82 Weitao Wang      2023-06-02  2039  			    major_revision == 0x03 &&
d9b0328d0b8b82 Weitao Wang      2023-06-02  2040  			    XHCI_EXT_PORT_PSIV(port_cap->psi[i]) >= 5)
d9b0328d0b8b82 Weitao Wang      2023-06-02 @2041  				minor_revision = tmp_minor_revision;
d9b0328d0b8b82 Weitao Wang      2023-06-02  2042  
47189098f8bebe Mathias Nyman    2015-10-01  2043  			xhci_dbg(xhci, "PSIV:%d PSIE:%d PLT:%d PFD:%d LP:%d PSIM:%d\n",
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2044  				  XHCI_EXT_PORT_PSIV(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2045  				  XHCI_EXT_PORT_PSIE(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2046  				  XHCI_EXT_PORT_PLT(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2047  				  XHCI_EXT_PORT_PFD(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2048  				  XHCI_EXT_PORT_LP(port_cap->psi[i]),
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2049  				  XHCI_EXT_PORT_PSIM(port_cap->psi[i]));
47189098f8bebe Mathias Nyman    2015-10-01  2050  		}
47189098f8bebe Mathias Nyman    2015-10-01  2051  	}
d9b0328d0b8b82 Weitao Wang      2023-06-02  2052  
d9b0328d0b8b82 Weitao Wang      2023-06-02  2053  	rhub->maj_rev = major_revision;
d9b0328d0b8b82 Weitao Wang      2023-06-02  2054  
d9b0328d0b8b82 Weitao Wang      2023-06-02  2055  	if (rhub->min_rev < minor_revision)
d9b0328d0b8b82 Weitao Wang      2023-06-02  2056  		rhub->min_rev = minor_revision;
d9b0328d0b8b82 Weitao Wang      2023-06-02  2057  
d9b0328d0b8b82 Weitao Wang      2023-06-02  2058  	port_cap->maj_rev = major_revision;
d9b0328d0b8b82 Weitao Wang      2023-06-02  2059  	port_cap->min_rev = minor_revision;
d9b0328d0b8b82 Weitao Wang      2023-06-02  2060  
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2061  	/* cache usb2 port capabilities */
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2062  	if (major_revision < 0x03 && xhci->num_ext_caps < max_caps)
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2063  		xhci->ext_caps[xhci->num_ext_caps++] = temp;
b630d4b9d05ba2 Mathias Nyman    2013-05-23  2064  
f1fd62a6b6c62e Zeng Tao         2018-12-07  2065  	if ((xhci->hci_version >= 0x100) && (major_revision != 0x03) &&
f1fd62a6b6c62e Zeng Tao         2018-12-07  2066  		 (temp & XHCI_HLC)) {
d195fcffe4c82c Xenia Ragiadakou 2013-08-14  2067  		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
d195fcffe4c82c Xenia Ragiadakou 2013-08-14  2068  			       "xHCI 1.0: support USB2 hardware lpm");
fc71ff7583b143 Andiry Xu        2011-09-23  2069  		xhci->hw_lpm_support = 1;
fc71ff7583b143 Andiry Xu        2011-09-23  2070  	}
fc71ff7583b143 Andiry Xu        2011-09-23  2071  
da6699ce4a889c Sarah Sharp      2010-10-26  2072  	port_offset--;
da6699ce4a889c Sarah Sharp      2010-10-26  2073  	for (i = port_offset; i < (port_offset + port_count); i++) {
bcaa9d5c59005e Mathias Nyman    2018-05-21  2074  		struct xhci_port *hw_port = &xhci->hw_ports[i];
da6699ce4a889c Sarah Sharp      2010-10-26  2075  		/* Duplicate entry.  Ignore the port if the revisions differ. */
07f7619053874b Mathias Nyman    2018-05-21  2076  		if (hw_port->rhub) {
4feb07d0ada339 Andy Shevchenko  2023-03-17  2077  			xhci_warn(xhci, "Duplicate port entry, Ext Cap %p, port %u\n", addr, i);
4feb07d0ada339 Andy Shevchenko  2023-03-17  2078  			xhci_warn(xhci, "Port was marked as USB %u, duplicated as USB %u\n",
07f7619053874b Mathias Nyman    2018-05-21  2079  					hw_port->rhub->maj_rev, major_revision);
da6699ce4a889c Sarah Sharp      2010-10-26  2080  			/* Only adjust the roothub port counts if we haven't
da6699ce4a889c Sarah Sharp      2010-10-26  2081  			 * found a similar duplicate.
da6699ce4a889c Sarah Sharp      2010-10-26  2082  			 */
bcaa9d5c59005e Mathias Nyman    2018-05-21  2083  			if (hw_port->rhub != rhub &&
bcaa9d5c59005e Mathias Nyman    2018-05-21  2084  				 hw_port->hcd_portnum != DUPLICATE_ENTRY) {
bcaa9d5c59005e Mathias Nyman    2018-05-21  2085  				hw_port->rhub->num_ports--;
bcaa9d5c59005e Mathias Nyman    2018-05-21  2086  				hw_port->hcd_portnum = DUPLICATE_ENTRY;
bcaa9d5c59005e Mathias Nyman    2018-05-21  2087  			}
f8bbeabc34aa94 Sarah Sharp      2010-12-09  2088  			continue;
da6699ce4a889c Sarah Sharp      2010-10-26  2089  		}
bcaa9d5c59005e Mathias Nyman    2018-05-21  2090  		hw_port->rhub = rhub;
cf0ee7c60c8964 Mathias Nyman    2020-02-11  2091  		hw_port->port_cap = port_cap;
bcaa9d5c59005e Mathias Nyman    2018-05-21  2092  		rhub->num_ports++;
da6699ce4a889c Sarah Sharp      2010-10-26  2093  	}
da6699ce4a889c Sarah Sharp      2010-10-26  2094  	/* FIXME: Should we disable ports not in the Extended Capabilities? */
da6699ce4a889c Sarah Sharp      2010-10-26  2095  }
da6699ce4a889c Sarah Sharp      2010-10-26  2096  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
