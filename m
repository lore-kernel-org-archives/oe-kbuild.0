Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810963C00
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 11:53:15 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id s11so51095029edy.8
        for <oe-kbuild@lists.linux.dev>; Tue, 07 Mar 2023 03:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678189993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NkdPSyehjwKYmLvWLkyPWmKGiOtGMMxDEWqdtEMk4c=;
        b=LcKQCUjPJ5xurUOVBzKyRhj8aqcwhIcfMTHS9lGxeOcBwLG1U1JDGb4Tg+XVjhTzIW
         UKv+8jh1Cz9RTgdECginimU7MDFDcDChE5NEjrw7cY8eAIsMKFOK1Z3901fobBpWRBb4
         XZpHQWgKsTbwo2zgAQh3Dz1VzDixUIz8JsrxElQkTP2wlNTW7yiINhoA/Fu47mihEKmG
         fP6IZBbiL181Om71kvgQfEiMpynLaist+GWtMyw17tGZiPTn5Osc4sO1EXpGoJNahbzD
         R+Drld/kn5WmdA4Iy7S5gLCvJiVflR+8diTTuWfOk3PIcfly67iBCcvuV1aBuTGMFHiF
         jFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NkdPSyehjwKYmLvWLkyPWmKGiOtGMMxDEWqdtEMk4c=;
        b=ZFgpbhspRydtiXE6x9ghQRLjtZSMZwXTM9QWozI3HZ6uAK4pa9PUk6aLfOOPCrmWla
         vxW/d6+ZIzJUaFlJRfEo8cn+vek7XudU9njyY0zcT7Ebrsy79kLtySc+HBRyES8LUuWU
         OMnLNsZLIdZwBK+H5aTT7/c+YdrQSKJ0yyf/5dN5mKv51ACd/BleeQapIAeNoyttzEFK
         /F+LdEHKL9kRgCRiEzXntAaTg+Cus55GzzOcucfkeoAReqk29mcICtYAR1HfSclzlX5B
         RT8yYEQE/RvCXaZ123Z/AR81c5EFCcYGhvJZajpmCUOqM2Tr+7yuIp1+9L0aBMx6s+WF
         3nbQ==
X-Gm-Message-State: AO0yUKV/ijGxWvKRpsze+MwK3995ywZjHCl1MFbGdOAFR9CN44Ue4ymD
	eqfG/lN+CKnEsM/XVZQXq54=
X-Google-Smtp-Source: AK7set9QlVQN6PT52JS2bYSSrKReY8tkz33LHDy5O0ZVgpczcuJmrynGdrhAh9fM2uNmqgyvfhPnjQ==
X-Received: by 2002:aa7:c396:0:b0:4bc:f925:5dbe with SMTP id k22-20020aa7c396000000b004bcf9255dbemr12560259edq.42.1678189993725;
        Tue, 07 Mar 2023 03:53:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s30-20020a508d1e000000b004c5d1a15bd5sm2586002eds.69.2023.03.07.03.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 03:53:13 -0800 (PST)
Date: Tue, 7 Mar 2023 14:53:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>, oe-kbuild@lists.linux.dev,
	lkp@intel.com
Cc: Hillf Danton <hdanton@sina.com>,
	Masami Ichikawa <masami.ichikawa@miraclelinux.com>,
	cip-dev <cip-dev@lists.cip-project.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, lwn@lwn.net, smatch@vger.kernel.org
Subject: Re: Who is looking at CVEs to prevent them?
Message-ID: <6d1ad8e9-2bec-4cd4-b4dd-595c88855274@kili.mountain>
References: <CAODzB9qjdhQkZ+tALHpDLHoK7GAf8Uybfzp8mxXt=Dwnn_0RjA@mail.gmail.com>
 <20230307110029.1947-1-hdanton@sina.com>
 <b27c7950-873a-f0e9-d7b4-322bb941a11f@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b27c7950-873a-f0e9-d7b4-322bb941a11f@suse.cz>

On Tue, Mar 07, 2023 at 12:42:03PM +0100, Vlastimil Babka wrote:
> Why do you keep adding linux-mm to the Cc list of random threads that are
> not about MM?

That's kbuild-bot stuff.  The kbuild-bot generates those emails and I
just look them over and hit send.

I don't why the kbuild bot CCs linux-mm either...  Let me ask the devs
about that.  A lot of the -mm warning are correct but just the CC list
is weird.

The kbuild-bot stuff is really nice for me.  The kbuild-bot doesn't use
the cross function DB so everything is local to the function and easy to
review.

regards,
dan carpenter


