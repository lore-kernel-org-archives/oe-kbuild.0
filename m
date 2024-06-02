Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C00386
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Jun 2024 06:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717310450; cv=none; b=lozKcS2/OycV5AREG7N2vrr4e+9oR5MLwabVzFFIALD5uatqVGAYYrCqAdhOKkafaUnPeLZX7R0Cr+3vfP+EmDPsgqPQcG4uHUnvprGa3MmhPvpjNPux+e1OMsWdsuY1GT+Kz86Mae8PUVeTdzuWw0pRTaDqu3N6HoRE9i8f1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717310450; c=relaxed/simple;
	bh=A1lMhTgD1kXhAmnNUJDOu+QGdxsrCHv/k45a5LTmR+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xxk6TEAAC3/tmOtbckciefkhw47idrnbXZikJgQy8lYKO76CvcGkKmLtG3rrRiFnEVPQRKg6WDT6VjysTu5OwjXcJrcDJJNuz5yIxV0SEfDJsG9x6BY6wKqnZxwLNUHH0yJ+5Lf0aYuTkhCE9J+07uMeAif2C1Izpq+0CNUvdh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNNcZLv7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNNcZLv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717310447; x=1748846447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1lMhTgD1kXhAmnNUJDOu+QGdxsrCHv/k45a5LTmR+Y=;
  b=FNNcZLv7N3bOFefmAbp0vDWfqjJOsISidZJh7kt7mxQoXwTRr4whCYTD
   apjgU9dtSomaj1wMsyx1oinhnbN+VaaHWeDpDhk2xo7ggff7MaZo8tkZD
   XBTbtuMBkSSpM1imiSeO1g5DQltGBIfioZ6xZ4QybT+7/8ILi+TJSIjQL
   mcoPhm8y1ZzZ4hvr8QciICBHMR/RmVjQzYBeUM5Z4Z0q0U+Xjr9eiFk9v
   Ytb77zumRjJSHni3le9JXDOItkyniTm3wM0xjjdE0VEIJVY2Rm7+q3Pl9
   NMSkelHn2JcwaSGGwnVXlCKiDH9Y328/uYtz08OsncylWR/1bVDNMN8+O
   A==;
X-CSE-ConnectionGUID: l9Qlz9lKQsi2TTGdj0Gicg==
X-CSE-MsgGUID: plFXWOzfTP2VX/gOLHy6YQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="24397247"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="24397247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 23:40:47 -0700
X-CSE-ConnectionGUID: vabG5mtvQv6+KJskEzFuLQ==
X-CSE-MsgGUID: t23wdTdJQ7WGUg88mM3qHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="37156950"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2024 23:40:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDetW-000Jp9-2A;
	Sun, 02 Jun 2024 06:40:42 +0000
Date: Sun, 2 Jun 2024 14:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:page_frag_cache_v6_0601 12/14]
 net/mptcp/protocol.c:1884 mptcp_sendmsg() error: uninitialized symbol 'va'.
Message-ID: <202406021444.rkdR9o1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v6_0601
head:   f85a99f1847e1f459addaa04381560ae355a3f74
commit: 4fa96d9fcfda9dd65a10544b5c5c1c42dfc0b530 [12/14] net: replace page_frag with page_frag_cache
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: openrisc-randconfig-r071-20240602 (https://download.01.org/0day-ci/archive/20240602/202406021444.rkdR9o1S-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406021444.rkdR9o1S-lkp@intel.com/

smatch warnings:
net/mptcp/protocol.c:1884 mptcp_sendmsg() error: uninitialized symbol 'va'.

vim +/va +1884 net/mptcp/protocol.c

29b5e5ef873979 Paolo Abeni      2024-03-01  1797  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1798  static int mptcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1799  {
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1800  	struct mptcp_sock *msk = mptcp_sk(sk);
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1801  	struct page_frag_cache *pfrag;
6d0060f600adfd Mat Martineau    2020-01-21  1802  	size_t copied = 0;
caf971df01b86f Paolo Abeni      2020-11-16  1803  	int ret = 0;
6d0060f600adfd Mat Martineau    2020-01-21  1804  	long timeo;
f870fa0b576884 Mat Martineau    2020-01-21  1805  
987858e5d026d3 Paolo Abeni      2021-04-23  1806  	/* silently ignore everything else */
1e777f39b4d75e Dmytro Shytyi    2022-11-25  1807  	msg->msg_flags &= MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_FASTOPEN;
987858e5d026d3 Paolo Abeni      2021-04-23  1808  
6511882cdd82d6 Paolo Abeni      2021-10-26  1809  	lock_sock(sk);
1954b86016cf85 Mat Martineau    2020-02-28  1810  
08e39c0dfa29f2 Eric Dumazet     2023-08-16  1811  	if (unlikely(inet_test_bit(DEFER_CONNECT, sk) ||
08e39c0dfa29f2 Eric Dumazet     2023-08-16  1812  		     msg->msg_flags & MSG_FASTOPEN)) {
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1813  		int copied_syn = 0;
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1814  
a2702a076e7378 Paolo Abeni      2023-04-14  1815  		ret = mptcp_sendmsg_fastopen(sk, msg, len, &copied_syn);
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1816  		copied += copied_syn;
fa9e57468aa10e Paolo Abeni      2022-10-21  1817  		if (ret == -EINPROGRESS && copied_syn > 0)
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1818  			goto out;
fa9e57468aa10e Paolo Abeni      2022-10-21  1819  		else if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1820  			goto do_error;
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1821  	}
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1822  
1954b86016cf85 Mat Martineau    2020-02-28  1823  	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
1954b86016cf85 Mat Martineau    2020-02-28  1824  
1954b86016cf85 Mat Martineau    2020-02-28  1825  	if ((1 << sk->sk_state) & ~(TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)) {
1954b86016cf85 Mat Martineau    2020-02-28  1826  		ret = sk_stream_wait_connect(sk, &timeo);
1954b86016cf85 Mat Martineau    2020-02-28  1827  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1828  			goto do_error;
1954b86016cf85 Mat Martineau    2020-02-28  1829  	}
1954b86016cf85 Mat Martineau    2020-02-28  1830  
69800e516e968f Paolo Abeni      2022-09-30  1831  	ret = -EPIPE;
69800e516e968f Paolo Abeni      2022-09-30  1832  	if (unlikely(sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)))
69800e516e968f Paolo Abeni      2022-09-30  1833  		goto do_error;
69800e516e968f Paolo Abeni      2022-09-30  1834  
17091708d1e503 Florian Westphal 2020-05-16  1835  	pfrag = sk_page_frag(sk);
18b683bff89d46 Paolo Abeni      2020-03-27  1836  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1837  	while (msg_data_left(msg)) {
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1838  		int total_ts, frag_truesize = 0;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1839  		struct mptcp_data_frag *dfrag;
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1840  		unsigned int offset = 0, size;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1841  		bool dfrag_collapsed;
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1842  		struct page *page;
29b5e5ef873979 Paolo Abeni      2024-03-01  1843  		u32 copy_limit;
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1844  		size_t psize;
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1845  		void *va;
29b5e5ef873979 Paolo Abeni      2024-03-01  1846  
29b5e5ef873979 Paolo Abeni      2024-03-01  1847  		/* ensure fitting the notsent_lowat() constraint */
29b5e5ef873979 Paolo Abeni      2024-03-01  1848  		copy_limit = mptcp_send_limit(sk);
29b5e5ef873979 Paolo Abeni      2024-03-01  1849  		if (!copy_limit)
29b5e5ef873979 Paolo Abeni      2024-03-01  1850  			goto wait_for_memory;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1851  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1852  		/* reuse tail pfrag, if possible, or carve a new one from the
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1853  		 * page allocator
fb529e62d3f3e8 Florian Westphal 2020-05-16  1854  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1855  		dfrag = mptcp_pending_tail(sk);
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1856  		size = 1;
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1857  		page = page_frag_alloc_probe(pfrag, &offset, &size, &va);
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1858  		dfrag_collapsed = mptcp_frag_can_collapse_to(msk, page, offset,
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1859  							     dfrag);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1860  		if (!dfrag_collapsed) {
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1861  			size = 32U + sizeof(struct mptcp_data_frag);
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1862  			page = mptcp_page_frag_alloc_prepare(sk, pfrag, &offset,
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1863  							     &size, &va);
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1864  			if (!page)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1865  				goto wait_for_memory;
cec37a6e41aae7 Peter Krystad    2020-01-21  1866  
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1867  			dfrag = mptcp_carve_data_frag(msk, page, offset);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1868  			frag_truesize = dfrag->overhead;
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1869  			va += dfrag->overhead;
72511aab95c94d Florian Westphal 2020-05-16  1870  		}
6d0060f600adfd Mat Martineau    2020-01-21  1871  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1872  		/* we do not bound vs wspace, to allow a single packet.
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1873  		 * memory accounting will prevent execessive memory usage
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1874  		 * anyway
d5f49190def61c Paolo Abeni      2020-09-14  1875  		 */
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1876  		psize = size - frag_truesize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1877  		psize = min_t(size_t, psize, msg_data_left(msg));
29b5e5ef873979 Paolo Abeni      2024-03-01  1878  		psize = min_t(size_t, psize, copy_limit);
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1879  		total_ts = psize + frag_truesize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1880  
6511882cdd82d6 Paolo Abeni      2021-10-26  1881  		if (!sk_wmem_schedule(sk, total_ts))
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1882  			goto wait_for_memory;
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1883  
4fa96d9fcfda9d Yunsheng Lin     2024-05-28 @1884  		ret = do_copy_data_nocache(sk, psize, &msg->msg_iter, va);
0ffe8e74904027 Paolo Abeni      2023-10-23  1885  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1886  			goto do_error;
72511aab95c94d Florian Westphal 2020-05-16  1887  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1888  		/* data successfully copied into the write queue */
5e6300e7b3a4ab Eric Dumazet     2023-08-31  1889  		sk_forward_alloc_add(sk, -total_ts);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1890  		copied += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1891  		dfrag->data_len += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1892  		frag_truesize += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1893  		WRITE_ONCE(msk->write_seq, msk->write_seq + psize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1894  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1895  		/* charge data on mptcp pending queue to the msk socket
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1896  		 * Note: we charge such data both to sk and ssk
fb529e62d3f3e8 Florian Westphal 2020-05-16  1897  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1898  		sk_wmem_queued_add(sk, frag_truesize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1899  		if (!dfrag_collapsed) {
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1900  			page_frag_alloc_commit(pfrag, frag_truesize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1901  			list_add_tail(&dfrag->list, &msk->rtx_queue);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1902  			if (!msk->first_pending)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1903  				WRITE_ONCE(msk->first_pending, dfrag);
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1904  		} else {
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1905  			page_frag_alloc_commit_noref(pfrag, frag_truesize);
6d0060f600adfd Mat Martineau    2020-01-21  1906  		}
4fa96d9fcfda9d Yunsheng Lin     2024-05-28  1907  
e4b6135134a75f Geliang Tang     2021-04-16  1908  		pr_debug("msk=%p dfrag at seq=%llu len=%u sent=%u new=%d", msk,
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1909  			 dfrag->data_seq, dfrag->data_len, dfrag->already_sent,
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1910  			 !dfrag_collapsed);
6d0060f600adfd Mat Martineau    2020-01-21  1911  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1912  		continue;
b51f9b80c032e1 Paolo Abeni      2020-03-27  1913  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1914  wait_for_memory:
037db6ea57da7a Paolo Abeni      2024-03-01  1915  		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
c2e6048fa1cf22 Paolo Abeni      2021-03-04  1916  		__mptcp_push_pending(sk, msg->msg_flags);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1917  		ret = sk_stream_wait_memory(sk, &timeo);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1918  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1919  			goto do_error;
57040755a3e43a Paolo Abeni      2020-01-21  1920  	}
6d0060f600adfd Mat Martineau    2020-01-21  1921  
13e1603739e58e Paolo Abeni      2020-12-16  1922  	if (copied)
c2e6048fa1cf22 Paolo Abeni      2021-03-04  1923  		__mptcp_push_pending(sk, msg->msg_flags);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1924  
1954b86016cf85 Mat Martineau    2020-02-28  1925  out:
cec37a6e41aae7 Peter Krystad    2020-01-21  1926  	release_sock(sk);
69800e516e968f Paolo Abeni      2022-09-30  1927  	return copied;
69800e516e968f Paolo Abeni      2022-09-30  1928  
69800e516e968f Paolo Abeni      2022-09-30  1929  do_error:
69800e516e968f Paolo Abeni      2022-09-30  1930  	if (copied)
69800e516e968f Paolo Abeni      2022-09-30  1931  		goto out;
69800e516e968f Paolo Abeni      2022-09-30  1932  
69800e516e968f Paolo Abeni      2022-09-30  1933  	copied = sk_stream_error(sk, msg->msg_flags, ret);
69800e516e968f Paolo Abeni      2022-09-30  1934  	goto out;
f870fa0b576884 Mat Martineau    2020-01-21  1935  }
f870fa0b576884 Mat Martineau    2020-01-21  1936  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
