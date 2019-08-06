﻿using System;
using System.Collections.Generic;

namespace Safir.Common.Domain
{
    public abstract class Entity : EntityMetadata
    {
        private readonly List<DomainEvent> _events = new List<DomainEvent>();

        public int Id { get; protected internal set; }

        public IReadOnlyCollection<DomainEvent> Events => _events;

        public void Add(DomainEvent @event)
        {
            if (@event == null) throw new ArgumentNullException(nameof(@event));

            _events.Add(@event);
        }
    }
}
