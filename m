Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974F86FAE
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Nov 2022 11:17:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j15so2275531wrq.3
        for <oe-kbuild@lists.linux.dev>; Thu, 03 Nov 2022 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3sIEjBWyXynnholyaDexBv6QBPUewq5QkgNXnoGaM0g=;
        b=l39OLGaI94HWz1EQ9Fm6hOPpBYZ1FO9Lo2GikSwEzVXzgaStzOJwQdTVxh5tZ8NJUe
         9Eqsx2igAfccnnHAQ4rry9pX5awlRTk9kX4is5Gs7B0rdZ4lOxukdJZ7Xd1bjSaCtCyN
         AQtJ5GneEPMCgRWCl53Y5zMheG2ayliVF2P2M1+nao3PJgKIKRb0Nj5A9FAijpwsyrlo
         GOL22aME2Wi2WuQ4vBgLRPcDHl6R5E+jOGqDstG7w77vUWqdEjIt/3s6QwDKhI5s+m8t
         t5WhZY9pstm+RyhbqL6pTSJrl9Lm6zcEjFvzAykuMKf+g/inpY1PIqjoZwpThg5KufXW
         EJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sIEjBWyXynnholyaDexBv6QBPUewq5QkgNXnoGaM0g=;
        b=BBWbN71R0rgv+r3nvjNs2efM5fFFRzx9LoO2a5YjPZpViIM/XscNl7O9PAflinmbK4
         MTIUnY8uhN9diPQr2N03B9g4MZyPs5KSB1XzVGqOJabP9LZPs1MrH4lq9oJzKrJg38Ol
         w+jcOF9kWuE8b3xpOrwACrz7emizg7Tm5qHLFDwy0F8RSVpFhi2WJ697zv67z45NRiJu
         cbfIotl5g0If44FGhiF94BlJRKE5pXodcl0KtwLiAevUbGBqPmjhm6IEoStS6FePo6KX
         BZ8bTfSM2LGoquj+uaDCNA+LUjLg77eXY/jplvUPNKM4t7up55OB5IPBE7SDcD+6xPoO
         z0eA==
X-Gm-Message-State: ACrzQf2PovPZRnnCGW0Txw+yaDLVm/kmyuXgKhPpTu5B2nGnERAEctCH
	K4/slk7LIIMCGuGX9bOGGHM=
X-Google-Smtp-Source: AMsMyM4D72ficrniPZ5H67Qv0PX840Dp/N3IPPBpHbHgWi5XAuSioMsKOEs9kq278I6r0fXKhgwF4g==
X-Received: by 2002:a5d:4b05:0:b0:236:e8fe:5656 with SMTP id v5-20020a5d4b05000000b00236e8fe5656mr7842854wrq.40.1667474224743;
        Thu, 03 Nov 2022 04:17:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q11-20020adfdfcb000000b002366e8eee11sm626724wrn.101.2022.11.03.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 04:17:04 -0700 (PDT)
Date: Thu, 3 Nov 2022 14:17:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>
Subject: Re: drivers/net/dsa/realtek/rtl8365mb.c:1349
 rtl8365mb_stats_update() error: uninitialized symbol 'ret'.
Message-ID: <Y2OjLbDSB45XAjLC@kadam>
References: <202210291504.tn2vPOLg-lkp@intel.com>
 <20221103110429.ehsswxabce3dqky3@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103110429.ehsswxabce3dqky3@bang-olufsen.dk>

On Thu, Nov 03, 2022 at 11:04:30AM +0000, Alvin Šipraga wrote:
> Hi,
> 
> On Sat, Oct 29, 2022 at 04:01:24PM +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> > CC: "Alvin Šipraga" <alsi@bang-olufsen.dk>
> > CC: Linus Walleij <linus.walleij@linaro.org>
> > CC: Florian Fainelli <f.fainelli@gmail.com>
> > CC: Vladimir Oltean <olteanv@gmail.com>
> > 
> > Hi Luiz,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   576e61cea1e4b66f52f164dee0edbe4b1c999997
> > commit: 319a70a5fea9590e9431dd57f56191996c4787f4 net: dsa: realtek-smi: move to subdirectory
> > date:   9 months ago
> > :::::: branch date: 8 hours ago
> > :::::: commit date: 9 months ago
> > config: microblaze-randconfig-m041-20221027
> > compiler: microblaze-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This is a false-positive, but smatch can be forgiven for not noticing
> it. How can I prevent this from showing up again? Thanks!
> 

Yeah, Smatch thinks you might be able to hit the continue on every
iteration through the loop.

kbuild warnings used to only show up once but now it seems you get
periodic reminders.  You also seem to have subscribed to the unfiltered
warnings.  I already had looked at this one and didn't forward it
because it's a false positive.  So most people would not have seen this
false postive.

Also I should probably ask the kbuild devs to change my email to
<error27@gmail.com> because I'm no longer at Oracle.  My script
converts it automatically for forwarded emails.

> >   1334  	for (i = 0; i < RTL8365MB_MIB_END; i++) {
> >   1335  		struct rtl8365mb_mib_counter *c = &rtl8365mb_mib_counters[i];
> >   1336  
> >   1337  		/* Only fetch required MIB counters (marked = 1 above) */
> >   1338  		if (!cnt[i])
> >   1339  			continue;
> >   1340  
> >   1341  		ret = rtl8365mb_mib_counter_read(smi, port, c->offset,
> >   1342  						 c->length, &cnt[i]);
> >   1343  		if (ret)
> >   1344  			break;
> >   1345  	}
> >   1346  	mutex_unlock(&mb->mib_lock);
> >   1347  
> >   1348  	/* Don't update statistics if there was an error reading the counters */
> >  @1349  	if (ret)
> >   1350  		return;


Loops are a tricky thing.  I could make it an assumption for this
"uninitialized variable" test that every loop goes through one time and
avoids all the continues...  They are mostly false positives.

regards,
dan carpenter

