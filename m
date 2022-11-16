Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCBD532;
	Wed, 16 Nov 2022 18:49:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id r127-20020a1c4485000000b003cfdd569507so1323285wma.4;
        Wed, 16 Nov 2022 10:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6eKT5NTIarecwN5cQtOsMkQ+nmlOhy9LvPh3nG/GYQ=;
        b=Cny+LjvTr1PZDHs4n+SsOPPPDljaGVD7NyFrhSf8+ZKEm7k31Lr0XvY+A7p1phb6PD
         ma5H3EcBxrPGskefHIU3zm8OuxgFVvtHONRDjDd4tIVDwayaWnjqmZ7hA0u2fwWfHJl5
         T5I0f8fcvx3DrqaUSndS9sEoMG4Gz6oSDTTIpNwGj9x37EaX1vqVRobSrwqERcO21t2M
         huDMHJsRItym7grOGIGyq/aJbq4vI1yqlH4hXGnN7vHsn2f4jlCqs30yFPH6jxQF1coC
         9rKLqtnJQ+PHSDL10ey+6f9yI0hO3QDjzg+HeM3CC0phOp8z2EHSDG4x+mlFpSiYz1Ia
         mSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6eKT5NTIarecwN5cQtOsMkQ+nmlOhy9LvPh3nG/GYQ=;
        b=sXyf7+0cpaK+iLAsu44GatNOrXmosLP3ce/U5ydbAhZps7b32QwNFyOxqiUvPVZjRi
         ogxeVhdjbR7HAGy9AyNaVM5JDrGQICk79zrBXWvftSxi5rEcnCBHdO4gNs46pHY+gY1l
         2r7TR5DZdbsu7XRHPRvAMLTDNM6sVvPghCk76T+QDdR6fAgBxABgXmt70AYyAZH7XDbG
         1gNZcvwwbJfQ6cdfBjBXnLSZOUEBlhfi5yNMcDE3rdDH0Q/EP/tgUIzklMZqnj22C50W
         yhrnHbwIGsKUtKV7YZGparFD0z8xgR1KBq0+Dv45MfscEWoPRISBrcXdtlqJduTM5tm1
         Wumg==
X-Gm-Message-State: ANoB5plqwlk1sIuo1L2YmzAswaZRfANyDOu53n/BbyLsVS7rDw+x2aMK
	wY79L7Vpx5qPGbLR1iZBeSGRiGCd3Ag=
X-Google-Smtp-Source: AA0mqf75eNCVdTO/kzn3EXmsKtMKv5m+9AxLWRwNIvU5zQ2+/rYGSaeCEmXlWQlAvMu6hGIL9dcf8w==
X-Received: by 2002:a05:600c:3495:b0:3cf:ae53:918f with SMTP id a21-20020a05600c349500b003cfae53918fmr3072529wmq.131.1668624583380;
        Wed, 16 Nov 2022 10:49:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d614f000000b0022ae401e9e0sm16145357wrt.78.2022.11.16.10.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:49:42 -0800 (PST)
Date: Wed, 16 Nov 2022 21:49:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless-5 29/79]
 net/rxrpc/io_thread.c:52 rxrpc_error_report() error: uninitialized symbol
 'skb'.
Message-ID: <Y3Uwwl4QjVNT1Jly@kadam>
References: <202211071354.ANknPOk9-lkp@intel.com>
 <2969791.1668607063@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2969791.1668607063@warthog.procyon.org.uk>

On Wed, Nov 16, 2022 at 01:57:43PM +0000, David Howells wrote:
> Dan Carpenter <error27@gmail.com> wrote:
> 
> > New smatch warnings:
> > net/rxrpc/io_thread.c:52 rxrpc_error_report() error: uninitialized symbol 'skb'.
> 
> Fixed that.
> 
> > Old smatch warnings:
> > net/rxrpc/io_thread.c:210 rxrpc_input_packet() warn: passing freed memory 'skb'
> 
> Do you know if that's still there?  "Old" in what sense?
> 

The file name has changed so it took me a while to track this down.
This is fine.  The "skb" pointer here is just used for tracing and not
dereferenced.

net/rxrpc/input.c
   563          /* Unshare the packet so that it can be modified for in-place
   564           * decryption.
   565           */
   566          if (sp->hdr.securityIndex != 0) {
   567                  struct sk_buff *nskb = skb_unshare(skb, GFP_ATOMIC);
                                                           ^^^
There is still a reference to "skb" somewhere but we drop ours.

   568                  if (!nskb) {
   569                          rxrpc_eaten_skb(skb, rxrpc_skb_unshared_nomem);
                                                ^^^
This would be a bug if it were dereferenced but it's just tracing stuff
that doesn't dereference the "skb" pointer.

   570                          return;
   571                  }
   572  
   573                  if (nskb != skb) {
   574                          rxrpc_eaten_skb(skb, rxrpc_skb_received);
   575                          skb = nskb;
   576                          rxrpc_new_skb(skb, rxrpc_skb_unshared);
   577                          sp = rxrpc_skb(skb);
   578                  }
   579          }

regards,
dan carpenter

