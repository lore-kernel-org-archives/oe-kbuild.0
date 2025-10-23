Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4282FF14C
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761213971; cv=none; b=uILs5yKDQ1oVnjFx3AWn5Rmvs/nGh4P2v9w3UBCNyI1U4d+UKwnZADd5VgQW0ekDQFhFgo/bpjtaaasgcHxtA/2EosHgUA8LyV+VkDFzKHvekD801nZC0aXU3L0qKgYmNCZELM3lM2bxkwCqzHnxvuWnk19r0xUXEiqOBSG/W+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761213971; c=relaxed/simple;
	bh=CtkIzpdTFP8ABoEugk1bXfexmgOmZNshpcm35HDVFzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJRM9Urp48WDJHUIW3jCPIB2U2CAA8w6DGKSV/Ky0D2S5N+tOkW0/x6CjBnCtzzVJ8SDOtalFJ29YfL3EeR0xdXHOYirPI6t34EXvROB+VLdKHjxtB5gnGni5708zVedTuD/VErDRT557DLRUogsKgrf2iVsT3JMlr2+MfMhZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id C45082C06647;
	Thu, 23 Oct 2025 12:06:05 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B34764A12; Thu, 23 Oct 2025 12:06:05 +0200 (CEST)
Date: Thu, 23 Oct 2025 12:06:05 +0200
From: Lukas Wunner <lukas@wunner.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [l1k:doe 12/12] lib/spdm/req-netlink.c:123
 spdm_netlink_sig_event() warn: missing unwind goto?
Message-ID: <aPn-DYB1KuZLZRfV@wunner.de>
References: <202510231302.hW7zNvXa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510231302.hW7zNvXa-lkp@intel.com>

On Thu, Oct 23, 2025 at 01:18:37PM +0800, kernel test robot wrote:
> tree:   https://github.com/l1k/linux doe
> head:   7505d39770b6e267ed934902a491e499ab4e6153
> commit: 7505d39770b6e267ed934902a491e499ab4e6153 [12/12] spdm: Multicast received signatures via netlink
[...]
> smatch warnings:
> lib/spdm/req-netlink.c:123 spdm_netlink_sig_event() warn: missing unwind goto?

False positive:

> 7505d39770b6e26 Lukas Wunner 2024-04-11   13  int spdm_netlink_sig_event(struct spdm_state *spdm_state,
[...]
> 7505d39770b6e26 Lukas Wunner 2024-04-11   47  	msg = genlmsg_new(msg_sz, GFP_KERNEL);
> 7505d39770b6e26 Lukas Wunner 2024-04-11   48  	if (!msg)
> 7505d39770b6e26 Lukas Wunner 2024-04-11   49  		return -ENOMEM;

New netlink message is allocated and subsequently filled with attributes.

> 7505d39770b6e26 Lukas Wunner 2024-04-11   86  	/* Loop over Netlink messages - break condition is in loop body */
> 7505d39770b6e26 Lukas Wunner 2024-04-11   87  	for (seq = 1; ; seq++) {

The function precalculates how many netlink messages it's going to need
to transmit the SPDM transcript.  The transcript is a blob transmitted
as fragments of the skb.

> 7505d39770b6e26 Lukas Wunner 2024-04-11   98  		/* Loop over fragments of this Netlink message */
> 7505d39770b6e26 Lukas Wunner 2024-04-11   99  		for (i = 0; i < nr_frags; i++) {

The fragments are attached to the skb until the (compile-time defined)
maximum number of fragments is reached.

> 7505d39770b6e26 Lukas Wunner 2024-04-11  109  		genlmsg_end(msg, hdr);
> 7505d39770b6e26 Lukas Wunner 2024-04-11  110  		rc = genlmsg_multicast(&spdm_nl_family, msg, 0,

The message is sent out and thus implicitly discarded.

> 7505d39770b6e26 Lukas Wunner 2024-04-11  115  		if (nr_pages == 0) /* End of loop - entire transcript sent */
> 7505d39770b6e26 Lukas Wunner 2024-04-11  116  			break;
> 7505d39770b6e26 Lukas Wunner 2024-04-11  117  
> 7505d39770b6e26 Lukas Wunner 2024-04-11  118  		/* Start new message for remainder of transcript */
> 7505d39770b6e26 Lukas Wunner 2024-04-11  119  		msg_sz = nlmsg_total_size(genlmsg_msg_size(nla_total_size(0)));
> 7505d39770b6e26 Lukas Wunner 2024-04-11  120  
> 7505d39770b6e26 Lukas Wunner 2024-04-11  121  		msg = genlmsg_new(msg_sz, GFP_KERNEL);
> 7505d39770b6e26 Lukas Wunner 2024-04-11  122  		if (!msg)
> 7505d39770b6e26 Lukas Wunner 2024-04-11 @123  			return -ENOMEM;

If the whole SPDM transcript hasn't been sent yet (end of loop condition),
then a new netlink message is begun.  If allocation of the message fails,
the function may "return" directly without goto.

Thanks,

Lukas
