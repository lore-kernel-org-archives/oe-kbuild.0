Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164F1B8FE;
	Thu, 11 May 2023 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683795230; x=1715331230;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=Jo6cVmlh3Njze/Vm0PTk6vT9CpLSHMxygg+Kd9Bm9hY=;
  b=XjP/QQkwvU+EChHh/59Ko3OrSlh8Ezs/POQhj2XDL+F2cpT0i1L4dOB/
   9unDHVG/CdKVrj4IfxkF5BLPj5z0dUrIy4SYQvtvysCMTpmX9r2yNWN2M
   I56jfhXd85hc9uG9zOdFHp9jbCK0haRbSMaSlDdvCoGJenkDJlDPlxKcF
   1gov5aBuHakYyWg7CK7XLNqqA2/HOfjx+ns1YE+usuANjD5I2oGhoufpM
   EASr1EwZYdt9wVjZTCoGsZXJD2W2tSuYZYSuVs8P8yluQ3+ySkD+Q3T5L
   s+hZ27xYHNcsqlKrOLag7ArP49MNslWU8QJw8AA9MFMyHbklJaCnMQs1L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334922589"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="334922589"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 01:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="946056335"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="946056335"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 11 May 2023 01:52:46 -0700
Message-ID: <7de2c84b-d793-316b-6f48-5abbc50866e9@linux.intel.com>
Date: Thu, 11 May 2023 11:54:21 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Weitao Wang <WeitaoWang-oc@zhaoxin.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <0cb9bebf-c126-433b-9ee9-e6f44b4652b4@kili.mountain>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [mnyman-xhci:for-usb-next 10/11] drivers/usb/host/xhci-mem.c:2040
 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.
In-Reply-To: <0cb9bebf-c126-433b-9ee9-e6f44b4652b4@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.5.2023 19.51, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
> head:   de6fcb4b6f1c55298b3ed0dd3d43961f86aa1b12
> commit: efcf3bab0767e057d8727b9a211fbb4fb4cdc81e [10/11] xhci: Show ZHAOXIN xHCI root hub speed correctly
> config: loongarch-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230510/202305102129.39U7mZoj-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202305102129.39U7mZoj-lkp@intel.com/
> 
> smatch warnings:
> drivers/usb/host/xhci-mem.c:2040 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.
> 
> vim +/tmp_minor_revision +2040 drivers/usb/host/xhci-mem.c
> 
> da6699ce4a889c Sarah Sharp      2010-10-26  1959  static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
> d5ddcdf4d672fd Mathias Nyman    2015-11-24  1960  		__le32 __iomem *addr, int max_caps)
> da6699ce4a889c Sarah Sharp      2010-10-26  1961  {
> da6699ce4a889c Sarah Sharp      2010-10-26  1962  	u32 temp, port_offset, port_count;
> da6699ce4a889c Sarah Sharp      2010-10-26  1963  	int i;
> efcf3bab0767e0 Weitao Wang      2023-05-09  1964  	u8 major_revision, minor_revision, tmp_minor_revision;
> 47189098f8bebe Mathias Nyman    2015-10-01  1965  	struct xhci_hub *rhub;
> a965315e59f3cb Adam Wallis      2018-05-22  1966  	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  1967  	struct xhci_port_cap *port_cap;
> da6699ce4a889c Sarah Sharp      2010-10-26  1968
> 47189098f8bebe Mathias Nyman    2015-10-01  1969  	temp = readl(addr);
> d5ddcdf4d672fd Mathias Nyman    2015-11-24  1970  	major_revision = XHCI_EXT_PORT_MAJOR(temp);
> b72eb8435b25be YD Tseng         2017-06-09  1971  	minor_revision = XHCI_EXT_PORT_MINOR(temp);
> 47189098f8bebe Mathias Nyman    2015-10-01  1972
> d5ddcdf4d672fd Mathias Nyman    2015-11-24  1973  	if (major_revision == 0x03) {
> 47189098f8bebe Mathias Nyman    2015-10-01  1974  		rhub = &xhci->usb3_rhub;
> 64364bc912c01b Thinh Nguyen     2021-03-10  1975  		/*
> 64364bc912c01b Thinh Nguyen     2021-03-10  1976  		 * Some hosts incorrectly use sub-minor version for minor
> 64364bc912c01b Thinh Nguyen     2021-03-10  1977  		 * version (i.e. 0x02 instead of 0x20 for bcdUSB 0x320 and 0x01
> 64364bc912c01b Thinh Nguyen     2021-03-10  1978  		 * for bcdUSB 0x310). Since there is no USB release with sub
> 64364bc912c01b Thinh Nguyen     2021-03-10  1979  		 * minor version 0x301 to 0x309, we can assume that they are
> 64364bc912c01b Thinh Nguyen     2021-03-10  1980  		 * incorrect and fix it here.
> 64364bc912c01b Thinh Nguyen     2021-03-10  1981  		 */
> 64364bc912c01b Thinh Nguyen     2021-03-10  1982  		if (minor_revision > 0x00 && minor_revision < 0x10)
> 64364bc912c01b Thinh Nguyen     2021-03-10  1983  			minor_revision <<= 4;
> efcf3bab0767e0 Weitao Wang      2023-05-09  1984  		/*
> efcf3bab0767e0 Weitao Wang      2023-05-09  1985  		 * Some zhaoxin's xHCI controller that follow usb3.1 spec
> efcf3bab0767e0 Weitao Wang      2023-05-09  1986  		 * but only support Gen1.
> efcf3bab0767e0 Weitao Wang      2023-05-09  1987  		 */
> efcf3bab0767e0 Weitao Wang      2023-05-09  1988  		if (xhci->quirks & XHCI_ZHAOXIN_HOST) {
> efcf3bab0767e0 Weitao Wang      2023-05-09  1989  			tmp_minor_revision = minor_revision;
> 
> tmp_minor_revision is only set for major_revision == 0x03
> (also XHCI_ZHAOXIN_HOST).
> 
> efcf3bab0767e0 Weitao Wang      2023-05-09  1990  			minor_revision = 0;
> efcf3bab0767e0 Weitao Wang      2023-05-09  1991  		}
> efcf3bab0767e0 Weitao Wang      2023-05-09  1992
> d5ddcdf4d672fd Mathias Nyman    2015-11-24  1993  	} else if (major_revision <= 0x02) {
> 47189098f8bebe Mathias Nyman    2015-10-01  1994  		rhub = &xhci->usb2_rhub;
> 47189098f8bebe Mathias Nyman    2015-10-01  1995  	} else {
> 4feb07d0ada339 Andy Shevchenko  2023-03-17  1996  		xhci_warn(xhci, "Ignoring unknown port speed, Ext Cap %p, revision = 0x%x\n",
> da6699ce4a889c Sarah Sharp      2010-10-26  1997  				addr, major_revision);
> da6699ce4a889c Sarah Sharp      2010-10-26  1998  		/* Ignoring port protocol we can't understand. FIXME */
> da6699ce4a889c Sarah Sharp      2010-10-26  1999  		return;
> da6699ce4a889c Sarah Sharp      2010-10-26  2000  	}
> da6699ce4a889c Sarah Sharp      2010-10-26  2001
> da6699ce4a889c Sarah Sharp      2010-10-26  2002  	/* Port offset and count in the third dword, see section 7.2 */
> b0ba9720846c98 Xenia Ragiadakou 2013-11-15  2003  	temp = readl(addr + 2);
> da6699ce4a889c Sarah Sharp      2010-10-26  2004  	port_offset = XHCI_EXT_PORT_OFF(temp);
> da6699ce4a889c Sarah Sharp      2010-10-26  2005  	port_count = XHCI_EXT_PORT_COUNT(temp);
> d195fcffe4c82c Xenia Ragiadakou 2013-08-14  2006  	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> 4feb07d0ada339 Andy Shevchenko  2023-03-17  2007  		       "Ext Cap %p, port offset = %u, count = %u, revision = 0x%x",
> da6699ce4a889c Sarah Sharp      2010-10-26  2008  		       addr, port_offset, port_count, major_revision);
> da6699ce4a889c Sarah Sharp      2010-10-26  2009  	/* Port count includes the current port offset */
> da6699ce4a889c Sarah Sharp      2010-10-26  2010  	if (port_offset == 0 || (port_offset + port_count - 1) > num_ports)
> da6699ce4a889c Sarah Sharp      2010-10-26  2011  		/* WTF? "Valid values are ‘1’ to MaxPorts" */
> da6699ce4a889c Sarah Sharp      2010-10-26  2012  		return;
> fc71ff7583b143 Andiry Xu        2011-09-23  2013
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2014  	port_cap = &xhci->port_caps[xhci->num_port_caps++];
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2015  	if (xhci->num_port_caps > max_caps)
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2016  		return;
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2017
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2018  	port_cap->psi_count = XHCI_EXT_PORT_PSIC(temp);
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2019
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2020  	if (port_cap->psi_count) {
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2021  		port_cap->psi = kcalloc_node(port_cap->psi_count,
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2022  					     sizeof(*port_cap->psi),
> a965315e59f3cb Adam Wallis      2018-05-22  2023  					     GFP_KERNEL, dev_to_node(dev));
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2024  		if (!port_cap->psi)
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2025  			port_cap->psi_count = 0;
> 47189098f8bebe Mathias Nyman    2015-10-01  2026
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2027  		port_cap->psi_uid_count++;
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2028  		for (i = 0; i < port_cap->psi_count; i++) {
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2029  			port_cap->psi[i] = readl(addr + 4 + i);
> 47189098f8bebe Mathias Nyman    2015-10-01  2030
> 47189098f8bebe Mathias Nyman    2015-10-01  2031  			/* count unique ID values, two consecutive entries can
> 47189098f8bebe Mathias Nyman    2015-10-01  2032  			 * have the same ID if link is assymetric
> 47189098f8bebe Mathias Nyman    2015-10-01  2033  			 */
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2034  			if (i && (XHCI_EXT_PORT_PSIV(port_cap->psi[i]) !=
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2035  				  XHCI_EXT_PORT_PSIV(port_cap->psi[i - 1])))
> cf0ee7c60c8964 Mathias Nyman    2020-02-11  2036  				port_cap->psi_uid_count++;
> 47189098f8bebe Mathias Nyman    2015-10-01  2037
> efcf3bab0767e0 Weitao Wang      2023-05-09  2038  			if (xhci->quirks & XHCI_ZHAOXIN_HOST &&
> efcf3bab0767e0 Weitao Wang      2023-05-09  2039  					XHCI_EXT_PORT_PSIV(port_cap->psi[i]) >= 5)
> efcf3bab0767e0 Weitao Wang      2023-05-09 @2040  				minor_revision = tmp_minor_revision;
> 
> We know XHCI_ZHAOXIN_HOST, but we don't know if major_revision == 0x03.


I'll add that check to make code more readable and silence smatch.

In practice we know that if PSIV >= 5, (port supports 10Gbps speed)
it must be a USB 3 port (major_revision == 0x03) and not a USB 2 port.

Thanks
Mathias

