Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BCF20FA;
	Thu, 10 Nov 2022 14:03:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id cl5so2381600wrb.9;
        Thu, 10 Nov 2022 06:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sro98eLXx+OAuWoCAWM6xR8mEtRvq9ZBNKEPbxgaokY=;
        b=Igh8tLt9trdoaxxucUgUAIM3TPH9hpaddX5kOiz2mVLM/oaCQ487sdCmZi170Hbklm
         p/Qk+ZhNMYCKlK4e+icGbatT3KpqjX6QBe1bzDubv/RkCWckAGdpguUUf9r6fXYXKdPp
         PE/pzxJ0Nu0TF9cnqnk6jw1jSbYejkF/VrvV0BMNNBO0Fw1UvZEdIw1WMZtRker6rRz9
         fh8ir9szc6PawVGW2wt1JK37LLLUi0XE0MVKBC7Txsf8ddalu502qLTdWC9aqiR7ADKU
         SubQ4BvXvA+6XHg1TuncPTHjuZglwI3+65leYR0ahiff1Q0T1LkW5q3Qs/CZ04TJtf7D
         a7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sro98eLXx+OAuWoCAWM6xR8mEtRvq9ZBNKEPbxgaokY=;
        b=KKzgXDRpHaMjlNk5YXHGHi6UkNcRDTzqPOzoTxbnj2y1mkL6KeMxf2CcjzkUr306Kf
         00mX+DRCcM3x7FnD4fU/0W/YZYXeiBRiUsZNCSC5zfoIDv6HFsry4ZvZbjS0MrMeFw3F
         c+yXwEsV0xPpoX2HCOG0Wgmrc802pC+xhR5s60OMlCqdycBVLOaiioVcHrZnrr5Enj0z
         k0X3OtWF4DapJROqVfa52hG+vdz/0R4CzprOyGuKYxgI7vshoe3WeXH3QtBbMJ9BlfxI
         WvnMkxCI/nm5VgfTI2P0mVq2yALMgVNsDt5riP74r+AT/JnxPdMGsZTz0oqq+XvUN761
         IiEw==
X-Gm-Message-State: ACrzQf3rrcSvgVtqHFAtpKkVXJ5lpyJXGOpFlq984KkzgIey/R9da9Qn
	GtSvvVZFZMyp/AuLzFvszXM=
X-Google-Smtp-Source: AMsMyM5d1pnbBOEUe8WRFue3TBV67BQ6lRP4FOXcCsf3hP4z1HTU/uQCBBSGV5/A4+qfU8vFk0Uh/A==
X-Received: by 2002:a5d:4d03:0:b0:22e:471b:c616 with SMTP id z3-20020a5d4d03000000b0022e471bc616mr1062594wrt.51.1668089012273;
        Thu, 10 Nov 2022 06:03:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d4c8f000000b00236a16c00ffsm15649618wrs.43.2022.11.10.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:03:31 -0800 (PST)
Date: Thu, 10 Nov 2022 17:03:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Message-ID: <Y20ErxBkDVVGzYim@kadam>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
 <Y2z4n8b+tEtzNR/4@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2z4n8b+tEtzNR/4@kadam>

On Thu, Nov 10, 2022 at 04:11:59PM +0300, Dan Carpenter wrote:
> On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
> > After running smatch on my tree I couldn't reproduce this warning:
> >   warn: pm_runtime_get_sync() also returns 1 on success
> > I'm using the latest smatch cloned from github. Do you append some
> > options to kchecker to get this output ?
> 
> TL;DR: Thanks for the report!  I will fix it later this week.
>

[ snip ]

> It creates a fake environment to test what !ret means
> for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
> the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".
> 
> Smatch shouldn't be printing warnings from inside the fake environment.

Nope.  That's not it...  It already has code to not print from a fake
environment (unless you're in debug mode).  It's a mystery how the
kbuild bot triggered this warning.

:(

regards,
dan carpenter


