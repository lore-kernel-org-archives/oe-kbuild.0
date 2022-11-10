Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B039F;
	Thu, 10 Nov 2022 07:06:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso3728062wmb.0;
        Wed, 09 Nov 2022 23:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hS2mzb0ymVFYyLFUNvvdonlye8wUvYJ1UYA7lGOiOk=;
        b=iWr92FmAGVG1Pj7oxGQjxxehnGtp8REhwjMv87ioep45GpNYW1x/Nu5+d4Svkf9OC0
         e8CIntISQKYqbJrEFVq6nafhBMaqFVPEXNcgcy1tqbmreicRPzXLWdf1CEf4lIFX7eOL
         ZUSaBop1li8vDOlaB78TnGsAEVX28Ff2kk6Vt6bz248yUz8GCPJFPOY46eJRtSRINf6t
         ESc4c9bR/cV1NWJvXlzkAkzFN2C4qXus+XZ3v9pzGpUgGjTDZOWUCEqbpFsjZysLkZoI
         w324lbLre0qF0d7uO36wv232MTwBNWgMBvIk4y5+1q4zKTmQFGsNUIfhjQi1u0ky57bB
         aohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hS2mzb0ymVFYyLFUNvvdonlye8wUvYJ1UYA7lGOiOk=;
        b=DTB+sjJ1iEzKJfd+admyCUUoNPNQQoPa9J1zRcst8f2JH+05Me00NkDkJPoR+LAfSK
         DaqpsVQdK+7Cd4iM2MJUyJHIfi2U0TQNPVUXVLCDYJMLjVpPxlzSoi4tzBK64r9XgMnU
         B3j/FRulIPcwH9lZUcKvtUVfXwuxMw5TGaRFevXK9sNz93ffCR6vvHkGvtRiokn9Ig5/
         ZwmRKKiwongnuHlGoMob2IGBerOT91hc51lodpr1/c8ae6O3q5zLU2kPWZIo0DXQKHNR
         o0DAkzvHQBAXD6DA7nq6aGDvXzzDxJ6FIUHYwHzHcaRzwH7lk8QQAm5BEgI8P1e1NBM2
         WqQQ==
X-Gm-Message-State: ACrzQf2dQN1R+ZSdbFlYN+xBL1kGRxJEb2pJySGzepW7aPXvVcY2IckN
	IrlqKdQ83J+5IJSn3iLKrNR3YbuKAXYg4Q==
X-Google-Smtp-Source: AMsMyM6uL9XftXUMhqDhK+Qp6WMtryOMFhn7tQgsZXbqKPBCW9MWCvY3JYQ1vKUXYaquy8YdIQiDcA==
X-Received: by 2002:a1c:7206:0:b0:3cf:76c4:ae9d with SMTP id n6-20020a1c7206000000b003cf76c4ae9dmr34677161wmc.204.1668063986046;
        Wed, 09 Nov 2022 23:06:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i5-20020adffc05000000b0023660f6cecfsm15032367wrr.80.2022.11.09.23.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 23:06:25 -0800 (PST)
Date: Thu, 10 Nov 2022 10:06:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless-5 19/77]
 net/rxrpc/input.c:519 rxrpc_input_data() warn: passing freed memory 'skb'
Message-ID: <202211100616.HvYb1VNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221110070622.Z_pEhK34yC_EPan3SRTID1zbuCiAg0CzNM_iWxaavII@z>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-ringless-5
head:   30d95efe06e18bd55691902bb4ec873e4b21a754
commit: dad511288b61094b347de3baa13077e648a40dec [19/77] rxrpc: Clone received jumbo subpackets and queue separately
config: openrisc-randconfig-m031-20221106
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
net/rxrpc/input.c:519 rxrpc_input_data() warn: passing freed memory 'skb'

Old smatch warnings:
net/rxrpc/input.c:1269 rxrpc_input_packet() warn: passing freed memory 'skb'

vim +/skb +519 net/rxrpc/input.c

dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  494  static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  495  {
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  496  	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  497  	enum rxrpc_call_state state;
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  498  	rxrpc_serial_t serial = sp->hdr.serial;
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  499  	rxrpc_seq_t seq0 = sp->hdr.seq;
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  500  
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  501  	_enter("{%u,%u},{%u,%u}",
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  502  	       call->rx_hard_ack, call->rx_top, skb->len, seq0);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  503  
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  504  	_proto("Rx DATA %%%u { #%u f=%02x }",
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  505  	       sp->hdr.serial, seq0, sp->hdr.flags);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  506  
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  507  	state = READ_ONCE(call->state);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  508  	if (state >= RXRPC_CALL_COMPLETE) {
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  509  		rxrpc_free_skb(skb, rxrpc_skb_freed);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  510  		goto out;
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  511  	}
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  512  
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  513  	/* Unshare the packet so that it can be modified for in-place
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  514  	 * decryption.
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  515  	 */
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  516  	if (sp->hdr.securityIndex != 0) {
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  517  		struct sk_buff *nskb = skb_unshare(skb, GFP_NOFS);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  518  		if (!nskb) {
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07 @519  			rxrpc_eaten_skb(skb, rxrpc_skb_unshared_nomem);

We can't use "skb" after skb_unshare().  It means we dropped our
reference to the skb.  The other reference holder probably holds a
reference so it will probably work, but it could also race and lead to
a use after free.

This only affects tracing code and not regular runtime but it's still a
bug.

dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  520  			return;
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  521  		}
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  522  
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  523  		if (nskb != skb) {
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  524  			rxrpc_eaten_skb(skb, rxrpc_skb_received);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  525  			skb = nskb;
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  526  			rxrpc_new_skb(skb, rxrpc_skb_unshared);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  527  			sp = rxrpc_skb(skb);
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  528  		}
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  529  	}
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  530  
dad511288b6109 net/rxrpc/input.c    David Howells 2022-10-07  531  	if (state == RXRPC_CALL_SERVER_RECV_REQUEST) {

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

